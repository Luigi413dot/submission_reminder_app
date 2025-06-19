#!/bin/bash
read -p "Enter your name: " name
assignment_dir="submission_remimder_${name}"
mkdir -p "$assignment_dir"
mkdir -p "$assignment_dir"/app "$assignment_dir"/modules "$assignment_dir"/assets "$assignment_dir"/config

cat > "${assignment_dir}/app/reminder.sh" << 'EOF'
#!/bin/bash
# Source environment variables and helper functions
 source./config/config.env
 source./modules/functions.sh
# Path to the submissions file
 submissions_file="./assets/submissions.txt"
# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "____________________________________________"
check_submissions $submissions_file
EOF
cat > "${assignment_dir}/modules/functions.sh" << 'EOF'
#!/bin/bash
# Function to read submission file and output students who have not submitted 
function check_submissions [
    local submission_file=$1
    echo "Checking submission in $submissions_file"
    #Skip the header and iterate through the lines 
    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs) 
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
           echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "submissions_file")
}
EOF
cat > "${assignment_dir}/config/config.env" << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS REMAINING=2
EOF


cat > "${assignment_dir}/assets/submissions.txt" << 'EOF'
student, assugnment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Ana, Shell Basics, sibmitted
Emmanuel, Shell Navigation, submitted
Sebastian Git, not submitted
Larry, Shell Nvigation, submitted
Miguel, Git, not submitted
Dan, Shell Basics, submitted
EOF

cat > "${assignment_dir}/startup.sh" << 'EOF'
#!/bin/bash
# Start the remainder application
./app/remainder.sh
EOF
# Make all .shscripts executable

find "${assignment_dir}" -type f -name "*.sh" -exec chmod +x {} \;
echo "The working directory has been successfully created in ${assignment_dir}"

