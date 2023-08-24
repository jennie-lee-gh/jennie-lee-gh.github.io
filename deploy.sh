# deploy.sh
#!/bin/bash
export HUGO_ENV=production
hugo
cp -r public/* .
git add .
git commit -m "Update site content"
git push origin main
