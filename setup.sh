#!/bin/bash

# QR Data Transfer - Quick Setup Script
# This script initializes the git repository and prepares for first push

echo "🚀 Setting up QR Data Transfer repository..."
echo ""

# Initialize git if not already initialized
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

# Add all files
echo ""
echo "📝 Adding files to git..."
git add .
echo "✅ Files added"

# Create initial commit
echo ""
echo "💾 Creating initial commit..."
git commit -m "Initial commit: QR Data Transfer app with documentation" || echo "⚠️  No changes to commit"
echo "✅ Initial commit created"

# Instructions for pushing to GitHub
echo ""
echo "🎉 Repository ready!"
echo ""
echo "📌 Next steps:"
echo "1. Create a new repository on GitHub: https://github.com/new"
echo "2. Run these commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Enable GitHub Pages in repository Settings → Pages"
echo "4. Select 'main' branch and save"
echo "5. Your app will be live at: https://YOUR_USERNAME.github.io/YOUR_REPO"
echo ""
echo "📖 For other deployment options, see docs/DEPLOYMENT.md"
echo ""
echo "✨ Happy coding!"
