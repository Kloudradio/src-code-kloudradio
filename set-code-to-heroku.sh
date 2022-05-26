#!/bin/bash
cd kloudradio
cat .env | sed -i -e 's/RAILS_ENV=development/RAILS_ENV=production/g' -e 's/NODE_ENV=development/NODE_ENV=production/g' .env
cat .env | sed -i -e 's/export KLOUDRADIO_HOST=localhost/export KLOUDRADIO_HOST=kloudradio.herokuapp.com/g'  .env
AUXSECRET=$( openssl rand -base64 32 )
cat .env | sed -i -e "s#export SECRET_KEY_BASE=insecure_key_for_dev#export SECRET_KEY_BASE=$AUXSECRET#" .env
heroku login
heroku container:login
docker-compose up --build -d &&
docker-compose exec rails db:create &&
docker-compose exec rails db:migrate &&
git add . &&
git commit -m "[Kloudradio committer]: $1" &&
git push heroku main
heroku container:push web
heroku container:release web
#heroku config:set SECRET_KEY_BASE=$AUXSECRET
heroku run rake db:create
heroku run rake db:migrate
echo "Secret Baase es $AUXSECRET"
cat .env | sed -i -e 's/RAILS_ENV=production/RAILS_ENV=development/g' -e 's/NODE_ENV=production/NODE_ENV=development/g' .env
cat .env | sed -i -e 's/export KLOUDRADIO_HOST=kloudradio.herokuapp.com/export KLOUDRADIO_HOST=localhost/g'  .env
cat .env | sed -i -e "s#export SECRET_KEY_BASE=$AUXSECRET#export SECRET_KEY_BASE=insecure_key_for_dev#" .env
AUXSECRET=$( heroku info | grep Owner )
cd ..
# tar --exclude={".git",".github"} -cf - kloudradio | (cd __last_code__ && tar -xf -)
git add . 
git commit -m "[$AUXSECRET]: $1"
git push
