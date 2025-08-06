@echo off
echo ========================================
echo    Checking SQLite Database
echo ========================================
echo.

if exist nhahangvietnam.db (
    echo Database file exists: nhahangvietnam.db
    echo File size: 
    dir nhahangvietnam.db | find "nhahangvietnam.db"
    echo.
    echo Database is ready!
) else (
    echo Database file does not exist yet.
    echo It will be created when you first run the application.
    echo.
)

echo.
echo To view database contents, you can use:
echo - SQLite Browser: https://sqlitebrowser.org/
echo - SQLite command line: sqlite3 nhahangvietnam.db
echo.
echo Press any key to continue...
pause >nul 