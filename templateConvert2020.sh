#!/bin/sh

input=$(find -name '*.*.template' -o -name '*.*.single');
for file in $input; do 
	newFile=$(echo "$file" | cut --complement -f 4 -d '.')
	mv  $file $newFile;

# Gradle property file update
original='JavadocDir = /JEM/jemh/Javadoc'
replace='JavadocDir = ./JEM/jemh/Javadoc'
 
LOGFILE=./templateConvertLog.log
(
   echo "Updating gradle file path"
   input=$(sed -i "s|${original}|${replace}|g" gradle.properties.template);
   echo "Updating gradle file done"

echo "Checking/making Javadoc folder"
if [ ! -d ./JEM/jemh/Javadoc ] 
then
    mkdir -p ./JEM/jemh/Javadoc
fi 
echo "JavaDoc Folder present"

echo "Create Index.html file"
echo '' > ./JEM/jemh/Javadoc/index.html
echo "Index.html created"

) >& $LOGFILE
done
