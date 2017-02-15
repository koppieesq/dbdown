# dbdown
Simple tool to download a Drupal database from your Pantheon project to your local environment.  It does three things:

1. Get a new database dump from your Pantheon dev server
2. Download the dumpfile, unzip
3. Load the dumpfile into your local Drupal environment

## Requirements

1. A local LAMP stack, especially mysql/mariadb!
2. Drupal site already running on your local environment
3. [Drush](http://www.drush.org/en/master/)
4. [Terminus 1.0](https://pantheon.io/docs/terminus/)

## Installation

1. Do a **git clone** to pull the project folder into your local environment.  You can install this anywhere you want, I would recommend inside your home directory.
2. Optional: Modify your .bashrc file and add a command alias so you can run dbdown from anywhere.  Eg.: `alias dbdown='sh ~/dbdown.sh'`

## Usage

1. Open a terminal and cd to your Drupal project, eg. `/var/www`
2. Type the dbdown command + the machine name of your Pantheon project.  Eg.: `dbdown demo-proj`
3. Use your saved time to do something personally rewarding, like knit a pair of socks.
