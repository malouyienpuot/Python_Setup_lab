# Malou Yien Puot - Assignment: Practical Development Setup

**Student:** Malou Yien Puot  
**Date:** 19/09/2026  
**Course:** Software Engineering Essential  
**Class Title:** Environment setup for Dart

## Section 1: Task 1 - Flutter & Dart Setup

### 1. Flutter environment verification

Run the following command in the terminal:

```powershell
flutter doctor
```

**Flutter Doctor Output**

> **Capture locally:** Paste the actual `flutter doctor` output here. This is machine-specific evidence and should not be invented.

### 2. Create the Flutter application and list devices

```powershell
flutter create my_first_app
cd my_first_app
flutter devices
```

**Available Devices**

> **Capture locally:** Paste the actual `flutter devices` output here.

### 3. Hot Reload vs Hot Restart

**Hot Reload** updates the running Flutter application with changed Dart code while preserving the current application state. It is useful for quickly checking UI changes, styling changes, and small logic changes without losing the current state.

**Hot Restart** restarts the Dart application and resets the in-memory application state. It is useful when changes involve initialization or when Hot Reload does not fully apply the change.

## Section 2: Task 2 - MySQL Database Management

### 1. Log in to MySQL

```bash
mysql -u root -p
```

### 2. Create the database, table, and sample records

The complete SQL script is also available in [school.sql](school.sql).

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

### 3. SELECT result

> **Capture locally:** Paste the actual terminal output from `SELECT * FROM students;` here and add a clear screenshot to the Google Doc.

### 4. Security Reflection

Using the MySQL `root` account for an application's backend connection is poor security practice because root is an administrative account with very broad privileges. If application credentials are exposed, an attacker could potentially access, modify, or delete data beyond what the application needs.

A dedicated application account follows the principle of least privilege. For example:

```sql
CREATE USER 'school_app'@'localhost'
IDENTIFIED BY 'replace-with-a-long-unique-password';

GRANT SELECT, INSERT, UPDATE, DELETE
ON school.*
TO 'school_app'@'localhost';

SHOW GRANTS FOR 'school_app'@'localhost';
```

The password should be replaced with a strong unique secret and stored securely, such as in environment variables or a secrets manager. It should never be committed to GitHub.

## Section 3: Task 3 - Python Virtual Environment

### 1. Create the project directory

**PowerShell:**

```powershell
New-Item -ItemType Directory -Path .\python_setup_lab
Set-Location .\python_setup_lab
py -m venv venv
.\venv\Scripts\Activate.ps1
```

### 2. Install and verify requests

```powershell
python -m pip install --upgrade pip
python -m pip install requests
python -m pip list
python -m pip freeze > requirements.txt
Get-Content .\requirements.txt
```

The `requests` package should appear in the package list. The generated `requirements.txt` should contain the installed package versions.

> **Note:** The repository's `requirements.txt` is a dependency specification. If the instructor requires the exact machine-generated freeze output, regenerate it locally with `python -m pip freeze > requirements.txt`.

### 3. Activation troubleshooting

If PowerShell blocks virtual-environment activation:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Then activate again:

```powershell
.\venv\Scripts\Activate.ps1
```

## Section 4: Task 4 - VS Code Workspace Screenshot

Install these VS Code extensions:

1. Flutter
2. Dart
3. Python
4. Pylance
5. MySQL

Open the `python_setup_lab` folder in VS Code and use **Python: Select Interpreter** to select:

```
python_setup_lab\venv\Scripts\python.exe
```

Open the integrated terminal and confirm that the `(venv)` prompt is active.

### Required single full-screen screenshot

The screenshot must clearly show all three items at the same time:

- The Extensions panel showing the required installed extensions.
- The integrated terminal showing the `(venv)` prompt.
- The bottom status bar showing the selected Python interpreter/environment.

> **Insert screenshot here:** Capture one clear, uncropped, full-screen VS Code screenshot on the actual computer.

## Google Docs Submission

Create a Google Doc named:

**Malou Yien Puot - Assignment: Practical Development Setup**

Use the following structure:

- Header: Malou yien puot, Date 19/9/2026, Course: Software Engineering Essential, Class Title: Environment setup for Dart
- Section 1: Task 1 - Flutter & Dart Setup
- Section 2: Task 2 - MySQL Database Management
- Section 3: Task 3 - Python Virtual Environment
- Section 4: Task 4 - VS Code Workspace Screenshot

Use a monospace font for command-line and SQL snippets. Make sure screenshots are clear, uncropped, and readable.

For sharing, use the Google account **Puotmalouyien@gmail.com**, then set:

**Share → General access → Anyone with the link → Viewer**

Finally, copy the Google Docs link and submit it through the course portal.
