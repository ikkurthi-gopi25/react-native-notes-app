#!/bin/bash

EC2_USER=ec2-user
EC2_IP=your.ec2.public.ip
KEY_PATH=~/.ssh/your-key.pem

ssh -i "$KEY_PATH" $EC2_USER@$EC2_IP << 'EOF'
  cd ~/react-native-notes-app
  git pull origin main
  npm install
  pm2 restart notes-app || pm2 start index.js --name notes-app
  sudo systemctl restart nginx
EOF
