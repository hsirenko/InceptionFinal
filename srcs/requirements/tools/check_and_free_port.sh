#!/bin/bash

PORT=443

# Check if port is in use
if lsof -i :$PORT > /dev/null 2>&1; then
    echo "Port $PORT is in use. Stopping conflicting services..."
    
    # Stop common services that might use port 443
    sudo systemctl stop apache2 2>/dev/null || true
    sudo systemctl stop nginx 2>/dev/null || true
    
    # If still in use, find and kill the process
    if lsof -i :$PORT > /dev/null 2>&1; then
        PID=$(sudo lsof -t -i :$PORT)
        echo "Killing process $PID using port $PORT"
        sudo kill -9 $PID 2>/dev/null || true
    fi
fi
echo "Port $PORT is now free"