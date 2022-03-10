cd kloudradio
cat .env | sed -i -e 's/RAILS_ENV=development/RAILS_ENV=production/g' -e 's/NODE_ENV=development/NODE_ENV=production/g' .env
heroku login
heroku container:login
docker-compose up --build -d
docker-compose exec rails db:migrate
git add . 
git commit -m "[set-code-to-heroku]: $1"
git push heroku main
heroku container:push web
heroku container:release web
cd ..
tar --exclude={".git",".github"} -cf - kloudradio | (cd __last_code__ && tar -xf -)
git add . 
git commit -m "[set-code-to-heroku]: $1"
git push