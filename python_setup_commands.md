# Python Setup Commands

Run from the parent directory in PowerShell:

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
