bundle install
bundle exec jekyll build
python3 remove_space_href.py
cp CNAME _site/CNAME

git add .
git commit -m 'release'
git push bb master

cd _site
git init
git remote add origin https://github.com/inspire-korea/inspire-korea.github.io.git
git add .
git commit -m 'release'
git fetch
git push origin master -f