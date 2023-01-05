#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
export PATH

cd /Users/jonah

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

instaData () {
    cd /Users/$USER/Desktop/
    mkdir -p instagram-data
    cd instagram-data
    instaloader --login=thecoolagency --post-metadata-txt="#_____ START Post id {shortcode}" --post-metadata-txt=" " --post-metadata-txt=" " --post-metadata-txt="date/filename: {date_utc}_UTC" --post-metadata-txt=" " --post-metadata-txt="{likes} likes." --post-metadata-txt="{comments} comments." --post-metadata-txt="caption:" --post-metadata-txt="{caption}" --post-metadata-txt=" " --post-metadata-txt="____________ #" --post-metadata-txt=" " --no-compress-json --no-video-thumbnails $1
    cd $1
    find . -type f -name '*.txt' -exec cat {} + >> ../$1-data.txt
    open -a Finder ../
}
