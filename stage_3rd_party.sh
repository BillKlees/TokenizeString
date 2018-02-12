#!/usr/bin/env bash

BOOSTPATH=https://github.com/boostorg/algorithm/archive/boost-1.66.0.zip
CELEROPATH=https://github.com/DigitalInBlue/Celero/archive/v2.1.1.zip

echo Internet access is required to download 3rd party libraries. 

if [ -d "$DIRECTORY" ]; then
	echo The directory \"3rdparty\" already exists. Delete the folder to download again.
	return 1
else
	echo Creating 3rdparty directory.
	mkdir 3rdparty
	mkdir 3rdparty/include
fi

echo Fetching Zip Files

`curl -L "${BOOSTPATH}" -o 3rdparty/boost.zip` 
`curl -L "${CELEROPATH}" -o 3rdparty/celero.zip`

echo Extracting Zip Files

`unzip -j 3rdparty/celero.zip "Celero-2.1.1/include/celero/*" -d 3rdparty/include/celero`
`unzip 3rdparty/boost.zip -d 3rdparty/`
`mv 3rdparty/algorithm-boost-1.66.0/include/boost 3rdparty/include/boost`

echo Done!


