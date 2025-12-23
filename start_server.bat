@echo off
REM Dedicated Server Launcher for RTS 2025
REM Usage: start_server.bat [port] [max_players]

SET PORT=%1
SET MAX_PLAYERS=%2

IF "%PORT%"=="" SET PORT=7777
IF "%MAX_PLAYERS%"=="" SET MAX_PLAYERS=8

echo ========================================
echo RTS 2025 - Dedicated Server
echo ========================================
echo Port: %PORT%
echo Max Players: %MAX_PLAYERS%
echo ========================================
echo.

REM Check if running from Godot editor
IF EXIST "project.godot" (
    echo Running from Godot editor...
    echo.
    echo IMPORTANT: Export your project first, then run this with the exported .exe
    echo.
    echo For now, you can test with:
    echo   1. Open Godot Editor
    echo   2. Press F5 to run
    echo   3. Press F1 to start server
    echo.
    pause
    exit /b
)

REM Check if exported executable exists
IF NOT EXIST "rts_2025.exe" (
    echo ERROR: rts_2025.exe not found!
    echo.
    echo Please export your project first:
    echo   1. Open project in Godot
    echo   2. Project menu ^> Export
    echo   3. Export for Windows
    echo   4. Name it "rts_2025.exe"
    echo.
    pause
    exit /b
)

REM Start the dedicated server
echo Starting dedicated server...
rts_2025.exe --headless --server --port=%PORT% --max-players=%MAX_PLAYERS%

pause
