#!/bin/bash
heroku login
STORED1="~"

# versión 1
heroku pg:psql postgresql-parallel-85491 -a kloudradio -c "\COPY $1(first_name, last_name, dob, email) FROM '$STORED1/kloudradio_stored1_$1' DELIMITER ',' CSV HEADER;"