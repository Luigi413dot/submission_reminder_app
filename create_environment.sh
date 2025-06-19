#!/bin/bash

echo "Enter your name:"
read username

dir="submission_reminder_${username}"
mkdir -p $dir/{app,modules,assets,config}

# Copy files (we'll add real content in next step)
touch $dir/app/reminder.sh
touch $dir/modules/functions.sh
touch $dir/assets/submissions.txt
touch $dir/config/config.env
touch $dir/startup.sh

echo "Directory structure created in $dir"
