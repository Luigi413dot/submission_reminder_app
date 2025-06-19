#!/bin/bash

source ./config/config.env
source ./modules/functions.sh
bash ./app/reminder.sh

find . -type f -name "*.sh" -exec chmod +x {} \;
