#!/bin/bash
heroku login
heroku git:clone -a kloudradio
cp .__set_env_to_heroku__ kloudradio/.env
