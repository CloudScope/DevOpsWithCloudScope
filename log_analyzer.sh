DevOps Class - 7 Assignment - 2

Objective

In the script file log_analyzer.sh already present on path /home/user write a script that analyzes system logs to identify, categorize, and summarize error messages. This script will allow users to interactively choose the type of log analysis they want to perform and display the results based on their selection.

NOTE: The script should have a help message for better understanding.
Help Message

Usage: ./log_analyzer.sh [-h] [-i] [log_file_path]

Analyze system logs to identify and summarize error messages.

Options:
-h Display this help message.
-i Interactive mode.
log_file_path Specify the path to the log file. Default is /var/log/syslog.

Interactive Mode

The script should start in an interactive mode that prompts the user to choose the type of analysis they wish to perform. Options should include:

- Count Errors: Count the logs total number of error messages.

- List Errors: List all unique error messages and their frequency.

- Search Errors: The user can enter a keyword to search for specific errors in the log.

TASK - 1:

Count the total number of log messages present in /home/user/logs/log_file.log.
NOTE: Provide the default log file path inside your script.

INPUT:

./log_analyzer.sh -i

OUTPUT:

Select the type of log analysis to perform:
1. Count Errors
2. List Errors
3. Search Errors
Enter your choice:

Enter the choice: 1

Total number of errors: 9



TASK - 2:

List all unique error messages and their frequency present in /home/user/logs/log_file.log.
NOTE: Provide the default log file path inside your script.

INPUT:

./log_analyzer.sh -i

OUTPUT:

Select the type of log analysis to perform:
1. Count Errors
2. List Errors
3. Search Errors
Enter your choice:

Enter the choice: 2

List of unique error messages and their frequencies:
1 error: Unauthorized access attempt.
1 error: System time synchronization failed.
1 error: Security certificate expired.
1 error: Failed to establish network connection.
1 error: Disk write failure.
1 error: Database connection timeout.
1 error: DNS resolution failure.
1 error: Could not load user profile.
1 error: Application failed to respond.



TASK - 3:

The user can enter a keyword to search for specific errors in the log present in /home/user/logs/log_file.log.
NOTE: Provide the default log file path inside your script.

INPUT:

./log_analyzer.sh -i

OUTPUT:

Select the type of log analysis to perform:
1. Count Errors
2. List Errors
3. Search Errors
Enter your choice:

Enter the choice: 3

Enter a keyword to search for specific errors:

Enter keyword: error

Searching for errors containing the keyword 'error':
2024-07-09T08:11:10.123Z server2 network.error: Failed to establish network connection.
2024-07-09T08:14:20.001Z server5 application.error: Application failed to respond.
2024-07-09T08:15:25.234Z server6 database.error: Database connection timeout.
2024-07-09T08:16:30.567Z server7 system.error: Disk write failure.
2024-07-09T08:18:40.123Z server9 security.error: Unauthorized access attempt.
2024-07-09T08:20:50.789Z server11 network.error: DNS resolution failure.
2024-07-09T08:21:55.012Z server12 system.error: System time synchronization failed.
2024-07-09T08:23:00.345Z server13 application.error: Could not load user profile.
2024-07-09T08:25:10.901Z server15 security.error: Security certificate expired.



Ans:

