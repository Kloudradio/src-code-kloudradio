#!/bin/bash
heroku login
STORED1="~"

## Original
## COPY persons(first_name, last_name, dob, email)
# FROM 'C:\sampledb\persons.csv'
# DELIMITER ','
# CSV HEADER;
heroku pg:psql postgresql-parallel-85491 -a kloudradio -c "\COPY $1(first_name, last_name, dob, email) FROM '$STORED1/kloudradio_stored1_$1' DELIMITER ',' CSV HEADER;"