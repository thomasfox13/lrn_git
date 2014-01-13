#!/bin/bash

if [ -z "$1" ];
then
	echo "A database name is required"
else

`pg_dump $1 > dump.sql`
`createdb -T template0 migrated-db`
`psql migrated-db < dump.sql`
 
fi
