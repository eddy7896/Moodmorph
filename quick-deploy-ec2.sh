#!/bin/bash

# Quick EC2 deployment script for MoodMorph
# Run this on your EC2 instance after connecting via SSH

echo "🚀 Quick MoodMorph EC2 Deployment"
echo "=================================="
echo "Optimized for AWS EC2 t2.micro free tier"
echo ""

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

# Run EC2-specific deployment script
echo "🔧 Running EC2 deployment script..."
chmod +x deploy-ec2.sh
./deploy-ec2.sh

echo ""
echo "✅ Quick EC2 deployment completed!"
echo "🌐 Your application should be available at: http://$(curl -s ifconfig.me)"
echo ""
echo "💡 EC2 t2.micro Tips:"
echo "   - Monitor memory: free -h"
echo "   - Check containers: docker stats"
echo "   - View logs: docker-compose -f docker-compose.ec2.yml logs -f"
