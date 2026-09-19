# Malou Yien Puot - Assignment: Practical Development Setup

**Student:** Malou Yien Puot  
**Date:** 19/09/2026  
**Course:** Software Engineering Essential  
**Class Title:** Environment setup for Dart

## Section 1: Task 1 - Flutter & Dart Setup

### Flutter verification
```powershell
flutter doctor
```
**Output:** Capture and paste the actual `flutter doctor` output here.

### Application initialization and devices
```powershell
flutter create my_first_app
cd my_first_app
flutter devices
```
**Available devices:** Capture and paste the actual `flutter devices` output here.

### Hot Reload vs Hot Restart
**Hot Reload** applies changed Dart code to the running application while preserving the current application state. Use it for rapid UI and small logic changes.

**Hot Restart** restarts the Dart application and resets in-memory state. Use it when initialization changes need to run again or Hot Reload does not fully apply a change.

## Section 2: Task 2 - MySQL Database Management

### SQL script
```sql
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
```

**SELECT result:** Capture the actual terminal output and add a clear screenshot to the Google Doc.

### Security Reflection
Using `root` for application connections is poor practice because it is an administrative account with broad privileges. If application credentials are compromised, excessive privileges can expose or damage unrelated database objects.

Use a dedicated least-privileged account:
```sql
CREATE USER 'school_app'@'localhost'
IDENTIFIED BY 'replace-with-a-long-unique-password';

GRANT SELECT, INSERT, UPDATE, DELETE
ON school.*
TO 'school_app'@'localhost';

SHOW GRANTS FOR 'school_app'@'localhost';
```
Store the real password securely and never commit it to GitHub.

## Section 3: Task 3 - Python Virtual Environment

### Commands
```powershell
New-Item -ItemType Directory -Path .\python_setup_lab
Set-Location .\python_setup_lab
py -m venv venv
.\venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install requests
python -m pip list
python -m pip freeze > requirements.txt
Get-Content .\requirements.txt
```

If PowerShell blocks activation:
```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## Section 4: Task 4 - VS Code Workspace Screenshot

Install **Flutter, Dart, Python, Pylance, and MySQL** extensions.

Use **Python: Select Interpreter** and select:
```
python_setup_lab\venv\Scripts\python.exe
```

Capture one full-screen, uncropped screenshot showing:
1. Extensions panel with the required extensions.
2. Integrated terminal with the `(venv)` prompt.
3. Bottom status bar showing the selected Python interpreter.

**Screenshot:** Insert the actual screenshot into the Google Doc.

## Google Docs Submission

Create: **Malou Yien Puot - Assignment: Practical Development Setup**

Header:
- Malou yien puot
- Date: 19/9/2026
- Course: Software Engineering Essential
- Class Title: Environment setup for Dart

Use monospace formatting for commands and SQL. Share from **Puotmalouyien@gmail.com** using **Anyone with the link → Viewer**, copy the link, and submit it on the course portal.

> The Google Docs link and machine-specific screenshots/output are intentionally left for the student to add after completing the setup locally.
