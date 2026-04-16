#!/bin/bash

echo "⏸️  Stopping the oracle-demo container gracefully..."
sudo docker stop oracle-demo 2>/dev/null || true

echo "✅ Container stopped!"
