#!/bin/bash
cd kloudradio
heroku login
docker-compose up --build -d
docker-compose exec website rails db:serup
git add . && git commit -m "[set-code-to-heroku]: $1"
heroku container:push web
heroku container:release web
heroku container:push web
git push heroku master