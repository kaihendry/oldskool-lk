#!/bin/bash

find orig -iname '*.jpg' | while read -r jpg
do
	echo "<a href=/$jpg><img width=230 height=230 src=/thumbs/${jpg}.jpg></a>"
done
