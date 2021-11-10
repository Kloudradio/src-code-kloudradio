#!/bin/bash
heroku login
docker-compose up --build -d
docker-compose exec website rails db:create db:migrate
git add . && git commit -m "[set-code-to-heroku]: $1"
heroku container:push -R
heroku run rails db:schema:load
git push heroku master