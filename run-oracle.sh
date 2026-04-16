#!/bin/bash

echo "🛑 Removing any existing oracle-demo container..."
sudo docker rm -f oracle-demo 2>/dev/null || true

echo "🚀 Running oracle-demo container in the background..."
sudo docker run -d -p 1521:1521 -e ORACLE_PASSWORD=oracle --name oracle-demo oracle-demo

echo "✅ Container started! Run ./db-logs.sh to watch the setup progress."
