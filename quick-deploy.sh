#!/bin/bash

# Quick deployment script for MoodMorph
# Run this on your VPS after connecting via SSH

echo "🚀 Quick MoodMorph Deployment"
echo "=============================="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "📦 Installing git..."
    sudo apt update && sudo apt install -y git
fi

# Clone repository if not exists
if [ ! -d "web-analyser" ]; then
    echo "📥 Cloning MoodMorph repository..."
    git clone https://github.com/eddy7896/web-analyser.git
fi

# Navigate to project directory
cd web-analyser

# Run main deployment script
echo "🔧 Running deployment script..."
chmod +x deploy.sh
./deploy.sh

echo ""
echo "✅ Quick deployment completed!"
echo "🌐 Your application should be available at: http://$(curl -s ifconfig.me)"
