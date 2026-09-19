-- Malou Yien Puot | Practical Development Setup | 19/09/2026

CREATE DATABASE IF NOT EXISTS school;
USE school;

CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    enrolled_on DATE NOT NULL
);

INSERT INTO students (name, email, enrolled_on)
VALUES
    ('Amina Hassan', 'amina.hassan@example.com', '2026-09-01'),
    ('Daniel Okello', 'daniel.okello@example.com', '2026-09-02');

SELECT * FROM students;

-- Least-privileged application account:
CREATE USER 'school_app'@'localhost'
IDENTIFIED BY 'replace-with-a-long-unique-password';

GRANT SELECT, INSERT, UPDATE, DELETE
ON school.*
TO 'school_app'@'localhost';

SHOW GRANTS FOR 'school_app'@'localhost';
