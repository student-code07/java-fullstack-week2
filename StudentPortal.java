package studentportal;

import java.util.ArrayList;
import java.util.Scanner;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;


public class StudentPortal {

    public static void main(String[] args) {

        // Collection to store students
        ArrayList<Student> students = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/student_management";
        String username = "root";
        String password = "Anupama@12";

        try {
            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("Database connected successfully!");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM students");

            while (rs.next()) {
                System.out.println(
                    rs.getInt("student_id") + " | " +
                    rs.getString("name") + " | " +
                    rs.getString("email") + " | " +
                    rs.getString("course") + " | " +
                    rs.getInt("age")
                );
            }
            String updateQuery = "UPDATE students SET age = ? WHERE student_id = ?";

            PreparedStatement ps = con.prepareStatement(updateQuery);

            ps.setInt(1, 22);
            ps.setInt(2, 1);

            ps.executeUpdate();

            System.out.println("Student age updated successfully!");

            ps.close();
            String deleteQuery = "DELETE FROM students WHERE student_id = ?";

            PreparedStatement psDelete = con.prepareStatement(deleteQuery);

            psDelete.setInt(1, 4);

            psDelete.executeUpdate();

            System.out.println("Student deleted successfully!");

            psDelete.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Database connection failed!");
            e.printStackTrace();
        }

        // Initial students
        students.add(new Student(1, "Anupama", "anupama@gmail.com"));
        students.add(new Student(2, "Sasmita", "sasmita@gmail.com"));
        students.add(new Student(3, "Sudiksha", "sudiksha@gmail.com"));

        Scanner sc = new Scanner(System.in);

        while (true) {

            System.out.println("\n===== STUDENT PORTAL =====");
            System.out.println("1. Add Student");
            System.out.println("2. View All Students");
            System.out.println("3. Search Student");
            System.out.println("4. Edit Student");
            System.out.println("5. Delete Student");
            System.out.println("6. Exit");

            System.out.print("Enter your choice: ");
            int choice = sc.nextInt();

            switch (choice) {

                case 1:
                    System.out.println("\n===== ADD STUDENT =====");

                    System.out.print("Enter Student ID: ");
                    int id = sc.nextInt();
                    sc.nextLine();

                    System.out.print("Enter Student Name: ");
                    String name = sc.nextLine();

                    System.out.print("Enter Student Email: ");
                    String email = sc.nextLine();

                    students.add(new Student(id, name, email));

                    System.out.println("Student added successfully!");
                    break;

                case 2:
                    System.out.println("\n===== ALL STUDENTS =====");

                    if (students.isEmpty()) {
                        System.out.println("No students available.");
                    } else {
                        for (Student s : students) {
                            System.out.println(
                                "ID: " + s.getId()
                                + " | Name: " + s.getName()
                                + " | Email: " + s.getEmail()
                            );
                        }
                    }
                    break;

                case 3:
                    System.out.println("\n===== SEARCH STUDENT =====");

                    System.out.print("Enter Student ID to search: ");
                    int searchId = sc.nextInt();

                    boolean found = false;

                    for (Student s : students) {

                        if (s.getId() == searchId) {

                            System.out.println("Student Found:");
                            System.out.println(
                                "ID: " + s.getId()
                                + " | Name: " + s.getName()
                                + " | Email: " + s.getEmail()
                            );

                            found = true;
                            break;
                        }
                    }

                    if (!found) {
                        System.out.println("Student not found.");
                    }

                    break;

                case 4:
                    System.out.println("\n===== EDIT STUDENT =====");

                    System.out.print("Enter Student ID to edit: ");
                    int editId = sc.nextInt();
                    sc.nextLine();

                    boolean edited = false;

                    for (Student s : students) {

                        if (s.getId() == editId) {

                            System.out.print("Enter new name: ");
                            String newName = sc.nextLine();

                            System.out.print("Enter new email: ");
                            String newEmail = sc.nextLine();

                            s.setName(newName);
                            s.setEmail(newEmail);

                            edited = true;

                            System.out.println("Student updated successfully!");

                            break;
                        }
                    }

                    if (!edited) {
                        System.out.println("Student not found.");
                    }

                    break;

                case 5:
                    System.out.println("\n===== DELETE STUDENT =====");

                    System.out.print("Enter Student ID to delete: ");
                    int deleteId = sc.nextInt();

                    boolean deleted = false;

                    for (int i = 0; i < students.size(); i++) {

                        if (students.get(i).getId() == deleteId) {

                            students.remove(i);

                            deleted = true;

                            System.out.println("Student deleted successfully!");

                            break;
                        }
                    }

                    if (!deleted) {
                        System.out.println("Student not found.");
                    }

                    break;

                case 6:
                    System.out.println("\nExiting Student Portal...");
                    sc.close();
                    return;

                default:
                    System.out.println( "Invalid choice. Please enter 1 to 6.");
            }
        }
    }
}
                    