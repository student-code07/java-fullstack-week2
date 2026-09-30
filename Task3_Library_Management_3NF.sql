-- TASK 3: LIBRARY MANAGEMENT DATABASE (3NF)
USE student_management;

-- BOOKS TABLE
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    available_copies INT
);

-- USERS TABLE
CREATE TABLE library_users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- ISSUE RECORDS TABLE
CREATE TABLE issue_records (
    issue_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    issue_date DATE NOT NULL,
    return_date DATE,

    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES library_users(user_id)
);
-- INSERT BOOKS
INSERT INTO books (book_id, title, author, category, available_copies)
VALUES
(1, 'Java Programming', 'James Gosling', 'Programming', 3),
(2, 'Python Basics', 'Mark Lutz', 'Programming', 4),
(3, 'Database Management Systems', 'Raghu Ramakrishnan', 'Database', 2);

-- INSERT LIBRARY USERS
INSERT INTO library_users (user_id, user_name, email)
VALUES
(1, 'Anupama', 'anupama@gmail.com'),
(2, 'Sasmita', 'sasmita@gmail.com'),
(3, 'Sudiksha', 'sudiksha@gmail.com');

-- INSERT ISSUE RECORDS
INSERT INTO issue_records (issue_id, book_id, user_id, issue_date, return_date)
VALUES
(1, 1, 1, '2026-09-25', NULL),
(2, 2, 2, '2026-09-26', '2026-09-29'),
(3, 3, 3, '2026-09-27', NULL);