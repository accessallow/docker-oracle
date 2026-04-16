#!/bin/bash

echo "🧹 Cleaning up old image if it exists..."
sudo docker rmi -f oracle-demo 2>/dev/null || true

echo "🏗️ Building new oracle-demo image..."
sudo docker build -t oracle-demo .

echo "✅ Build complete!"
