DevOps Class - 7 Assignment - 5

Objective:

In the script file regex_tool.sh already present on path /home/user write a script that performs regex-based operations on text files, including searching, replacing, and extracting data, either interactively or via command-line arguments. It includes a help message, interactive prompts, and ensures the specified file is accessible and readable before executing operations.

Script Requirements

TASK - 1:

Help Flag (-h)

When the script is run with the -h flag, it should display a help message detailing the available operations and their usage.

INPUT:

./regex_tool.sh -h

OUTPUT:

Usage: ./regex_tool.sh [-h] [-i] [--file filename] [operation regex [replacement]]

Perform regex-based operations on text files.

Options:
-h Display this help message.
-i Interactive mode.
--file filename Specify the file to operate on.

Operations:
search regex Search for patterns using regex and display all matching lines.
replace regex new Replace occurrences of regex with new string.


TASK - 2:

Interactive Mode for search option (-i)

Search: Use regex to search for patterns in the file and display all matching lines.

INPUT:

./regex_tool.sh -i

OUTPUT:

Enter the filename:

Enter the complete path to the file from where logs will fetched:
/home/user/sample_data/sample_text.txt

Choose operation (search, replace):

Choose operation:
search

Enter regex:

Enter regex:
error 404

Error 404: Page not found

TASK - 3:

Interactive Mode for replace option (-i)

Replace: Use regex to replace occurrences of a pattern with a new string.

INPUT:

./regex_tool.sh -i

OUTPUT:

Enter the log filename:

Enter the complete path to the file from where logs will fetched:
/home/user/log_data/sample_log.log

Choose operation (search, replace):

Choose operation:
replace

Enter regex:

Enter regex:
Error 404

Enter replacement text:

Enter replacement text:
CHECK 200

Before performing above task:
Error 404: Page not found
After performing above task:
CHECK 200: Page not found

TASK - 4:

Command Line Arguments

The script should accept command-line arguments for automation purposes, allowing operations to be specified without interactive prompts. This should include the file path, operation type, and necessary regex patterns or criteria.

INPUT:

./regex_tool.sh --file /home/user/sample_data/sample_text.txt search "error"

OUTPUT:

Error 404: Page not found
Error 500: Internal Server Error


Ans:



