# Practical Development Setup

**Student names:** Abdikadir Madey; Gatluak Gorden
**Date:** 2026-09-03
**Course/Class:** Practical Development Setup

> This document is a submission-ready record of the required commands. Outputs and
> screenshots marked **To be captured locally** must be replaced with evidence from
> the computer where Flutter, MySQL, and VS Code are installed. No credentials are
> included in this repository.

## Task 1 - Flutter & Dart Setup

### Flutter verification

Run:

```powershell
flutter doctor
```

**Output summary — To be captured locally:**

```text
Paste the complete flutter doctor summary here, including the [✓], [!], and [✗]
status lines.
```

### Application initialization and devices

```powershell
flutter create my_first_app
Set-Location .\my_first_app
flutter devices
```

**Available target devices — To be captured locally:**

```text
Paste the flutter devices output here.
```

### Hot Reload vs Hot Restart

**Hot Reload** injects updated Dart code into the running application while
preserving the current application state. Use it for rapid UI and small logic
changes when you want to keep the current navigation position and entered data.

**Hot Restart** stops and starts the Flutter application's Dart isolate again.
It applies changes that need initialization to run again, but resets in-memory
state. Use it when a hot reload does not apply a change correctly, or after
changing initialization logic, global state, or similar startup behavior.

## Task 2 - MySQL Database Management

### SQL script

Log in locally as root, then execute the following script:

```sql
mysql -u root -p

CREATE DATABASE school;
USE school;

CREATE TABLE students (
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

### `SELECT *` result — To be captured locally

```text
Paste the terminal output from SELECT * FROM students; here.
```

Attach a clear screenshot of that output to the final Google Doc.

### Security reflection

The `root` account is intended for administration, not application traffic. It
typically has unrestricted privileges, so a stolen application password could
allow an attacker to read, alter, or delete every database. Applications should
use a separate account with access limited to the required database and
operations.

For a dedicated account, connect as an administrator and run:

```sql
CREATE USER 'school_app'@'localhost' IDENTIFIED BY 'replace-with-a-long-unique-password';
GRANT SELECT, INSERT, UPDATE, DELETE ON school.* TO 'school_app'@'localhost';
SHOW GRANTS FOR 'school_app'@'localhost';
```

Do not grant `ALL PRIVILEGES` unless the application genuinely requires it. Keep
the password in a secret manager or environment variable, never in source control.

## Task 3 - Python Virtual Environment

Run these commands from the parent directory:

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

The package list should include `requests`; the generated `requirements.txt`
records the installed dependency versions. If PowerShell blocks activation,
run the following once in the current user scope, then repeat activation:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## Task 4 - VS Code Workspace Screenshot

Install these extensions from the VS Code Extensions panel:

- Flutter
- Dart
- Python
- Pylance
- MySQL

Open the repository (or the `python_setup_lab` folder), select
`python_setup_lab\venv\Scripts\python.exe` with **Python: Select Interpreter**,
and open a new integrated terminal so it displays `(venv)`.

Insert one full-screen screenshot in the final Google Doc showing all of the
following at once:

1. The active Extensions panel with the five installed extensions.
2. The integrated terminal with the `(venv)` prompt.
3. The bottom status bar with the selected Python interpreter.

**Screenshot — To be captured locally:**
`[Insert the single uncropped VS Code screenshot here.]`

## Google Docs Submission Checklist

1. Create a blank Google Doc named **[Your Full Name] - Assignment: Practical
   Development Setup**.
2. Copy this document's sections into the Google Doc and replace every
   **To be captured locally** block with the actual output or screenshot.
3. Use a monospace font for PowerShell and SQL snippets.
4. Set **Share → General access → Anyone with the link → Viewer** (or
   **Commenter** if instructor feedback is required), then copy the link.
5. Submit the copied Google Docs link through the course portal.
