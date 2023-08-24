#!/bin/bash

# Create index.md
echo "# Jennie's BBQ & Grills Blog" > index.md
echo "![Author Avatar](https://avatars.githubusercontent.com/u/131510772?v=4)" >> index.md
echo "Welcome to Jennie Lee's BBQ & Grills blog. A space where grill enthusiasts come to gather, learn, and share experiences. Whether you're here to discover the intricacies of the best grilling techniques or to dive into insightful product reviews, there's something for every BBQ lover. With a burning passion (pun intended) for everything grill-related, Jennie delves into the world of BBQs, ensuring that her readers are equipped with the knowledge to have the best grilling experience." >> index.md
echo "[Check out this awesome site!](http://foxheightspubandgrill.com/)" >> index.md
echo '<iframe src='"'"'http://foxheightspubandgrill.com/'"'"' width='"'"'100%'"'"' height='"'"'500'"'"'></iframe>' >> index.md

# Add list of all markdown files (except index.md) to index.md
for file in *.md; do
    if [[ $file != "index.md" ]]; then
        base_name=$(basename "$file" .md)
        echo "- [${base_name}](/${base_name})" >> index.md
    fi
done

# Commit and push to GitHub
git add .
git commit -m "Update index.md with blog intro and file list"
git push origin main

# Create sitemap.xml
echo '<?xml version="1.0" encoding="UTF-8"?>' > sitemap.xml
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> sitemap.xml

# Add URLs for each markdown file
for file in *.md; do
    base_name=$(basename "$file" .md)
    echo "  <url>" >> sitemap.xml
    echo "    <loc>https://jennie-lee-gh.github.io/${base_name}</loc>" >> sitemap.xml
    echo "    <changefreq>monthly</changefreq>" >> sitemap.xml
    echo "    <priority>0.8</priority>" >> sitemap.xml
    echo "  </url>" >> sitemap.xml
done

echo '</urlset>' >> sitemap.xml

# Commit the changes to GitHub
git add .
git commit -m "Auto commit"
git push origin main
