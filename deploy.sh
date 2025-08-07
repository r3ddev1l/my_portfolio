#!/bin/bash

# Exit on error
set -e

# Ask for a commit message
read -p "Enter commit message for gh-pages: " commit_msg

# Build the Flutter web app
flutter build web

# Create a temporary directory for gh-pages
rm -rf ../gh-pages-temp
mkdir ../gh-pages-temp

# Copy the web build into the temp directory
cp -r build/web/* ../gh-pages-temp/

# Add CNAME file for custom domain
echo "www.srijanmaharjan.com.np" > ../gh-pages-temp/CNAME

# Navigate to the temp directory
cd ../gh-pages-temp

# Initialize git if not already
git init

# Set remote if not already set
git remote add origin https://github.com/r3ddev1l/my_portfolio.git 2> /dev/null || true

# Checkout gh-pages branch
git checkout -b gh-pages

# Add and commit changes
git add .
git commit -m "$commit_msg"

# Force push to gh-pages branch
git push origin gh-pages --force

# Clean up
cd ..
rm -rf gh-pages-temp

echo "✅ Deployed to gh-pages branch. GGMU!!!!!! 😈👹👺"
