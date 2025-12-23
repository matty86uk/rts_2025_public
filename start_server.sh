#!/bin/bash
# Dedicated Server Launcher for RTS 2025
# Usage: ./start_server.sh [port] [max_players]

PORT=${1:-7777}
MAX_PLAYERS=${2:-8}

echo "========================================"
echo "RTS 2025 - Dedicated Server"
echo "========================================"
echo "Port: $PORT"
echo "Max Players: $MAX_PLAYERS"
echo "========================================"
echo

# Check if running from Godot editor directory
if [ -f "project.godot" ]; then
    echo "Running from Godot editor directory..."
    echo
    echo "IMPORTANT: Export your project first, then run this with the exported binary"
    echo
    echo "For now, you can test with:"
    echo "  1. Open Godot Editor"
    echo "  2. Press F5 to run"
    echo "  3. Press F1 to start server"
    echo
    read -p "Press Enter to continue..."
    exit 0
fi

# Check if exported executable exists
if [ ! -f "rts_2025.x86_64" ] && [ ! -f "rts_2025" ]; then
    echo "ERROR: Exported binary not found!"
    echo
    echo "Please export your project first:"
    echo "  1. Open project in Godot"
    echo "  2. Project menu > Export"
    echo "  3. Export for Linux"
    echo "  4. Name it 'rts_2025'"
    echo
    read -p "Press Enter to continue..."
    exit 1
fi

# Find the executable
EXECUTABLE=""
if [ -f "rts_2025.x86_64" ]; then
    EXECUTABLE="./rts_2025.x86_64"
elif [ -f "rts_2025" ]; then
    EXECUTABLE="./rts_2025"
fi

# Make sure it's executable
chmod +x "$EXECUTABLE"

# Start the dedicated server
echo "Starting dedicated server..."
"$EXECUTABLE" --headless --server --port="$PORT" --max-players="$MAX_PLAYERS"
