IS_INSTALL=$1

if [ -z $IS_INSTALL ]; then
  echo 'Do you want to execute "bundle install"? [y/n]'
  read IS_INSTALL
fi

if [ "$IS_INSTALL" = "y" ]; then
  bundle install
fi

bundle exec jekyll build
python remove_space_href.py
cp CNAME _site/CNAME

git add .
git commit -m 'release'
git push bb master

cd _site
git init
git remote add origin https://github.com/inspire-korea/inspire-korea.github.io.git
git checkout master
git add .
git commit -m 'release'
git fetch
git checkout -b master
git push origin master -f