#! /bin/sh

echo -e "Running web scrapers for shouldigotothemountains"

cd $HOME/Documents/Development/shouldigotothemountains/

heroku run rake reports:scrape_colorado_reports



