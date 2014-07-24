#!/bin/bash

rm -f template
mkdir -p build
cd build
cmake ..
make
if [ $? -eq 0 ];
then
	cp ./src/template ../template
	../template
else
	echo -e "\033[31mError occurred."
	echo -e "\033[0m"
fi
