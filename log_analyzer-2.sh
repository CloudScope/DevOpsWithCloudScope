DevOps Class - 7 Assignment - 4

Objective:

In the script file log_analyzer.sh already present on path /home/user write a script that utilizes regular expressions to perform log analysis tasks on system log files. This script should allow users to apply various regex-based operations to filter and categorize data from log files.

Script Requirements

TASK - 1:

Help Flag (-h)

When the script is run with the -h flag, it should display a help message detailing the available operations and their usage.

INPUT:

./log_analyzer.sh -h

OUTPUT:

Usage: ./log_analyzer.sh [-h] [-i] [--file filename] [operation criteria]

Perform regex-based log analysis on system log files.

Options:
-h Display this help message.
-i Interactive mode.
--file filename Specify the log file to operate on.

Operations:
filter level Filter logs by level (INFO, WARN, ERROR, DEBUG).
categorize Categorize logs by level and display counts.


TASK - 2:

Interactive Mode for filter option (-i)

Filter: Use regex to filter log entries based on criteria like error levels (INFO, ERROR, WARN, DEBUG), timestamps, or specific text content.

INPUT:

.log_analyzer.sh -i

OUTPUT:

Enter the log filename:

Enter the complete path to the file from where logs will fetched:
/home/user/log_data/sample_log.log

Choose operation (filter, categorize):

Choose operation:
filter

Enter criteria (for filter: ERROR/INFO/WARN/DEBUG):

Enter criteria:
ERROR

2024-07-09 08:12:31 ERROR Failed to load configuration.
2024-07-10 09:00:00 ERROR Unable to reach database server.

TASK - 3:

Interactive Mode for categorize option (-i)

Categorize: Use regex to categorize log entries by modules or features, displaying counts for each category.

INPUT:

.log_analyzer.sh -i

OUTPUT:

Enter the log filename:

Enter the complete path to the file from where logs will fetched:
/home/user/log_data/sample_log.log

Choose operation (filter, categorize):

Choose operation:
categorize

2 WARN
2 ERROR
1 INFO
1 DEBUG


TASK - 4:

Command Line Arguments

The script should accept command-line arguments for automation purposes, allowing operations to be specified without interactive prompts. This should include the file path, operation type, and necessary regex patterns or criteria.

INPUT:

./log_analyzer.sh --file /home/user/log_data/sample_log.txt filter "ERROR"

OUTPUT:

The area of the square is 25 square units.



Ans:

#!/bin/bash

display_help() {
    echo "Usage: ./log_analyzer.sh [-h] [-i] [--file filename] [operation criteria]"
    echo ""
    echo "Perform regex-based log analysis on system log files."
    echo ""
    echo "Options:"
    echo "-h               Display this help message."
    echo "-i               Interactive mode."
    echo "--file filename  Specify the log file to operate on."
    echo ""
    echo "Operations:"
    echo "filter level     Filter logs by level (INFO, WARN, ERROR, DEBUG)."
    echo "categorize       Categorize logs by level and display counts."
    exit 0
}

filter_logs() {
    grep -E "$1" "$2"
}

categorize_logs() {
    echo "INFO: $(grep -c "INFO" "$1")"
    echo "WARN: $(grep -c "WARN" "$1")"
    echo "ERROR: $(grep -c "ERROR" "$1")"
    echo "DEBUG: $(grep -c "DEBUG" "$1")"
}

interactive_mode() {
    echo "Enter the log filename:"
    read -r filepath

    if [[ ! -f $filepath ]]; then
        echo "File not found!"
        exit 1
    fi

    echo "Choose operation (filter, categorize):"
    read -r operation

    case $operation in
        filter)
            echo "Enter criteria (ERROR/INFO/WARN/DEBUG):"
            read -r criteria
            filter_logs "$criteria" "$filepath"
            ;;
        categorize)
            categorize_logs "$filepath"
            ;;
        *)
            echo "Invalid operation!"
            exit 1
            ;;
    esac
}

if [ $# -eq 0 ]; then
    display_help
fi

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h) display_help ;;
        -i) interactive_mode ;;
        --file)
            shift
            filename="$1"
            ;;
        filter)
            shift
            filter_logs "$1" "$filename"
            exit 0
            ;;
        categorize)
            categorize_logs "$filename"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            display_help
            ;;
    esac
    shift
done
