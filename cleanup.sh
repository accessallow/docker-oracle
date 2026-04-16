#!/bin/bash

echo "🛑 Stopping and completely deleting oracle-demo container..."
sudo docker rm -f oracle-demo 2>/dev/null || true

echo "🗑️ Deleting oracle-demo image..."
sudo docker rmi -f oracle-demo 2>/dev/null || true

echo "✨ All clean!"
