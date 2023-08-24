# deploy.sh
#!/bin/bash
hugo
cp -r public/* .
git add .
git commit -m "Update site content"
git push origin main
