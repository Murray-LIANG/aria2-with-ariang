#!/bin/bash
if [ $2 -eq 1 ]; then
	if [[ "$3" == /tmp_download/movies* ]]; then
		mv "$3" /downloads/movies
	else
		mv "$3" /downloads
	fi
fi
echo [$(date)] $2, $3, $1 "<br>" >> /downloads/_log.html