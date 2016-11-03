#!/usr/bin/env bash
SITE=$1
echo "Hello!  Welcome to DB Down."
echo "I will download the database from the dev environment of" $SITE
echo "Then I will load it into your local environment."
echo -e "\033[1;31m You should run this command from your local Drupal environment. \033[0m"

if [ -z "$1" ]; then
    echo "You need to specify the site you want to download from."
    exit 1
fi
echo "I'm gonna download the database from" $SITE
terminus auth login
terminus site backups create --element=database --site=$SITE --env=dev
echo "Downloading to ~/Downloads"
OUTPUT=$(terminus site backups get --element=database --to=~/Downloads --latest --site=$SITE --env=dev | tail -1)
echo "Now I need to unzip" $OUTPUT
gunzip < $OUTPUT | drush sqlc
echo "All set!  Now a little housekeeping."
drush updb -y
drush cc all