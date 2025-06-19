#!/bin/bash

echo "Enter new assigment name:"
read new_assignment

# Update assignment name in config.env
sed -i "s/^ASSIGNMENT=./ASSIGNMENT=\"$new_assignment\"/" submission_reminder_/config/config.env
echo "Assignment updated to $new_assignment"
cd submission_reminder_*/
.?startup.sh