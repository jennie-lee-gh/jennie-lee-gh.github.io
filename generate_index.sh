#!/bin/bash

# Start with the blog intro
cat > index.md << EOL
## BBQ & Grills Blog - A Culinary Journey
**Author**: Jennie Lee

There's something primal and exciting about cooking food over an open flame. It's an art form that has been around for centuries and is an integral part of many cultures around the world. This is the essence that Jennie Lee captures in her BBQ & Grills blog.

From the tantalizing aroma of smoked meats wafting through the air to the sizzle of vegetables on a hot grill, barbecuing is not just a method of cooking; it's an experience. And in her blog, Jennie delves deep into this culinary world, sharing tips, recipes, and stories that ignite passion and make mouths water.

Each post is a new adventure, whether it's about mastering the perfect brisket, finding the right wood chips for smoking, or exploring the world of outdoor grills. Jennie's expertise and passion shine through, making it a must-read for both beginners and seasoned grill masters.

For those who are eager to immerse themselves in the world of barbecuing, Jennie has also recommended the perfect spot to begin this journey: [Fox Heights Pub and Grill](http://foxheightspubandgrill.com/). It's a haven for BBQ enthusiasts and those keen on savoring some delectable grilled dishes.

So, whether you're a barbecue novice or a grill connoisseur, Jennie's BBQ & Grills blog promises a flavorful journey that is both informative and delightful. Dive in and let the flavors envelop you!

![Author Avatar](https://avatars.githubusercontent.com/u/131510772?v=4)

EOL

# List all the files in the directory
for file in *; do
  if [[ -f "$file" && "$file" != "index.md" ]]; then
    # Remove the file extension to create the link
    base_name=$(basename "$file" .md)
    echo "- [$base_name](/$base_name)" >> index.md
  fi
done

# Add the link and iframe to the given website
echo -e "\n[Visit Fox Heights Pub and Grill](http://foxheightspubandgrill.com/)\n" >> index.md
echo '<iframe src="http://foxheightspubandgrill.com/" width="100%" height="500"></iframe>' >> index.md

# Commit the changes to GitHub
git add .
git commit -m "Auto commit"
git push origin main
