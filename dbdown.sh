#!/usr/bin/env bash

# First command line argument is the target site.  Second argument is the target environment.
SITE=$1
ENV=$2
if [ -z "$1" ]; then
    echo "You need to specify the site you want to download from."
    exit 1
fi

# If no environment, then default to dev
if [ -z "$2" ]; then
	ENV='dev'
fi
NOW=$(date +"%Y%m%d")
OUTPUT=$HOME/Downloads/$SITE.$ENV$NOW.sql.gz
echo "Hello!  Welcome to DB Down."
echo "I will download the database from the $ENV environment of" $SITE
echo "Then I will load it into your local environment."
echo "\033[1;31m You should run this command from your local Drupal environment. \033[0m"

echo "I'm gonna download the database from" $SITE
terminus auth:login
terminus backup:create --element=database $SITE.dev
echo "Downloading to $HOME/Downloads"
terminus backup:get --element=database --to=$OUTPUT $SITE.$ENV
echo "Now I need to unzip $OUTPUT"
gunzip < $OUTPUT | drush sqlc
echo "All set!  Now a little housekeeping."
drush updb -y
drush cc all
