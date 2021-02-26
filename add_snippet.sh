#!/bin/bash

SCREENSHOT=$(find ~/Desktop -maxdepth 1 -name "ss*.png")

if [ $SCREENSHOT ]
then
  echo "-- 🗳️  What is the folder name? 📁"
else
  echo " --> ❌ Take a screen shot and rename it ss.png 📷"
  exit
fi

read  FOLDER_NAME

echo " --> ✅ folder created 📁"

# CREATE
# db stands for debug
mkdir ~/Desktop/snippets_test/DB_$FOLDER_NAME

echo "-- 🗳️ What is the Snippt title? 📁"

read MESSAGE

# Create markdown file in snippets
FILE=~/Desktop/snippets_test/DB_$FOLDER_NAME/solution.md
FOLDER=~/Desktop/snippets_test/DB_$FOLDER_NAME

echo "# SNIPPET: $MESSAGE" > $FILE

echo " --> ✅ file created with title 📁"

echo "--> 📩 Moving screen shot 📷 to: 📁 $SCREENSHOT... "

mv $SCREENSHOT $FOLDER

# Update file with basic template
echo "" >> $FILE
echo "![screenshot](./ss.png)" >> $FILE
echo "" >> $FILE
echo "*please report details about the error and the solution*" >> $FILE
echo "" >> $FILE
echo "## Issue Description:" >> $FILE
echo "" >> $FILE
echo "## Solution:" >> $FILE

echo " --> 👍 SNIPPET READY!"

code $FILE
# Create a new script file to search for pervios error and open in new window
# open -a Terminal ~/Desktop

pwd

READY_TO_COMMIT=n

while [ $READY_TO_COMMIT != y ]
do
  echo "-- Are you ready to commit? y/n:"
  read ANS
  READY_TO_COMMIT=$ANS
done

echo "--> 🔄 comminting now..."

git add .
git commit -m "[SJ][UNTRACKED] $MESSAGE 📢"
git push

echo " --> ✅ SNIPPET COMMITED! 🙌--"








