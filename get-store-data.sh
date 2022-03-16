#!/bin/bash
heroku login
STORED1="~"

# version 1
# \COPY (SELECT * FROM shifts WHERE user_id = '7') TO '~/shifts_export.csv' WITH (FORMAT csv, DELIMITER ',',  HEADER true);
heroku pg:psql postgresql-parallel-85491 -a kloudradio --command="\COPY $1 TO '$STORED1/kloudradio_stored1_$1' WITH (FORMAT csv, DELIMITER ',',  HEADER true);"