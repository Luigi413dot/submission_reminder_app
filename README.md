# submission_reminder_app

✅ STEP 1: Setup the App Environment
You run the create_environment.sh script.

It:

Asks your name.

Creates a folder named submission_reminder_{yourName}.

Inside this folder, it creates the correct folder and file structure (config, source code, data).

Populates the folder with these files:

config/config.env

scripts/reminder.sh

scripts/functions.sh

scripts/startup.sh (you will create this one)

data/submissions.txt (containing at least 5 students)

Makes all .sh scripts executable using chmod.

🚀 STEP 2: Start the Reminder System
You run the startup.sh script (that you write).

It:

Reads the current assignment name from config.env.

Calls the logic in functions.sh and reminder.sh.

Processes the submissions.txt file to find which students haven’t submitted.

Displays or alerts which students need reminders.

🔁 STEP 3: Change Assignment Name
You run the copilot_shell_script.sh script.

It:

Prompts for a new assignment name.

Updates the ASSIGNMENT value in config/config.env (line 2).

Re-runs startup.sh to show the non-submitting students for the new assignment.

🧪 STEP 4: Test the App
After setup, test that:

The directory and files were created.

The permissions were set.

startup.sh shows the correct output.

copilot_shell_script.sh correctly updates and triggers the app.
