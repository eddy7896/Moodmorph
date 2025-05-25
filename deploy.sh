#!/bin/bash

# MoodMorph Deployment Script for VPS
# This script sets up and deploys the MoodMorph application using Docker

set -e

echo "🚀 Starting MoodMorph deployment..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install required packages
echo "🔧 Installing required packages..."
sudo apt install -y git curl wget

# Install Docker if not already installed
if ! command -v docker &> /dev/null; then
    echo "🐳 Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    rm get-docker.sh
else
    echo "✅ Docker already installed"
fi

# Install Docker Compose if not already installed
if ! command -v docker-compose &> /dev/null; then
    echo "🔧 Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo "✅ Docker Compose already installed"
fi

# Configure firewall
echo "🔥 Configuring firewall..."
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable

# Build and start the application
echo "🏗️ Building and starting MoodMorph..."
docker-compose -f docker-compose.prod.yml down --remove-orphans
docker-compose -f docker-compose.prod.yml build --no-cache
docker-compose -f docker-compose.prod.yml up -d

# Wait for services to start
echo "⏳ Waiting for services to start..."
sleep 30

# Check if services are running
echo "🔍 Checking service status..."
docker-compose -f docker-compose.prod.yml ps

# Get server IP
SERVER_IP=$(curl -s ifconfig.me)

echo ""
echo "🎉 Deployment completed successfully!"
echo "📍 Your MoodMorph application is now running at:"
echo "   http://$SERVER_IP"
echo ""
echo "📊 To check logs:"
echo "   docker-compose -f docker-compose.prod.yml logs -f"
echo ""
echo "🔄 To restart services:"
echo "   docker-compose -f docker-compose.prod.yml restart"
echo ""
echo "🛑 To stop services:"
echo "   docker-compose -f docker-compose.prod.yml down"
echo ""
