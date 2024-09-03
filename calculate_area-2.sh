DevOps Class - 7 Assignment - 3

Objective

Enhance the previously created calculate_area.sh script by integrating structured logging to improve debugging and traceability of the scripts operations.

Script Requirements



TASK - 1:

Help Flag (-h)

When the script is run with the -h flag, it should display a help message detailing the types of areas it can calculate. Example areas include circles, squares, and rectangles.

INPUT:

./calculate_area.sh -h

OUTPUT:

Usage: ./calculate_area.sh [-h] [-i] [--debug] [--logfile filename] [shape dimensions]

Calculate the area of various geometric shapes.

Options:
-h Display this help message.
-i Interactive mode.
--debug Enable detailed debug logging.
--logfile Specify the file to log to.

Shapes:
circle radius Calculate the area of a circle.
square side Calculate the area of a square.
rectangle length width Calculate the area of a rectangle.


TASK - 2:

Interactive Mode (-i)

- Running the script with the -i flag should initiate an interactive mode where the script prompts the user to choose the type of area they wish to calculate.

- Based on the selected type, the script should then ask for the necessary dimensions:

- Circle: Request the radius.

- Square: Request the side length.

- Rectangle: Request the length and width.

- Record the calculated value as a log entry in /home/user/logs/calculate_area.log file.

NOTE: Provide the default log file path inside your script, the value of default path should be /home/user/logs/calculate_area.log.

INPUT:

./calculate_area.sh -i

OUTPUT:

Select the type of area to calculate:
1. Circle
2. Square
3. Rectangle
Enter choice:

Enter choice: 1

Enter the radius:

Enter the radius: 5

The area of the circle is 78.53975 square units.

After the above steps a line should be added in /home/user/logs/calculate_area.log file, in the below given format:

[2024-07-16 22:06:50] [INFO] :: Calculated area of the circle with radius 5: 78.53975



TASK - 3:

Debug (-- debug)

- Implement the --debug flag. When this flag is used, include detailed debugging information in the logs.

- Default logging should be at the INFO level, providing general information about the script's operation.


INPUT:

./calculate_area.sh --debug rectangle 5 10

OUTPUT:

The area of the rectangle is 50 square units.

Log File Entry:

[2024-07-16 22:14:39] [INFO] :: Calculated area of the rectangle with length 5 and width 10: 50


TASK - 4:

Log Levels and Flags (--logfile)

If the --logfile flag is provided, user should be able to redirect log to a file.

INPUT:
./calculate_area.sh --logfile /home/user/logs/calculate_area.log square 5

OUTPUT:

The area of the square is 25 square units.

Log File Entry:

[2024-07-16 22:16:36] [INFO] :: Calculated area of the square with side 5: 25




Ans:

#!/bin/bash

LOG_LEVEL="INFO"
LOG_FILE="/home/user/logs/calculate_area.log"

log_message() {
    local log_level="$1"
    local message="$2"
    local log_file="${3:-$LOG_FILE}" # Use default log file if not specified

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$log_level] :: $message" >> "$log_file"
}

display_help() {
    echo "Usage: $0 [-h] [-i] [--debug] [--logfile filename] [shape dimensions]"
    echo
    echo "Calculate the area of various geometric shapes."
    echo
    echo "Options:"
    echo "  -h        Display this help message."
    echo "  -i        Interactive mode."
    echo "  --debug   Enable detailed debug logging."
    echo "  --logfile Specify the file to log to."
    echo
    echo "Shapes:"
    echo "  circle radius           Calculate the area of a circle."
    echo "  square side             Calculate the area of a square."
    echo "  rectangle length width  Calculate the area of a rectangle."
}

calculate_circle() {
    local radius="$1"
    local area=$(echo "3.14159 * $radius * $radius" | bc -l)
    log_message "INFO" "Calculated area of the circle with radius $radius: $area"
    echo "The area of the circle is $area square units."
}

calculate_square() {
    local side="$1"
    local area=$(echo "$side * $side" | bc)
    log_message "INFO" "Calculated area of the square with side $side: $area"
    echo "The area of the square is $area square units."
}

calculate_rectangle() {
    local length="$1"
    local width="$2"
    local area=$(echo "$length * $width" | bc)
    log_message "INFO" "Calculated area of the rectangle with length $length and width $width: $area"
    echo "The area of the rectangle is $area square units."
}

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -h | --help )
    display_help
    exit
    ;;
  -i | --interactive )
    INTERACTIVE_MODE=1
    ;;
  --debug )
    LOG_LEVEL="DEBUG"
    ;;
  --logfile )
    shift; LOG_FILE="$1"
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

interactive_mode() {
    echo "Select the type of area to calculate:"
    echo "1. Circle"
    echo "2. Square"
    echo "3. Rectangle"
    read -p "Enter choice: " choice

    case $choice in
        1)
            read -p "Enter the radius: " radius
            calculate_circle $radius
            ;;
        2)
            read -p "Enter the side length: " side
            calculate_square $side
            ;;
        3)
            read -p "Enter the length: " length
            read -p "Enter the width: " width
            calculate_rectangle $length $width
            ;;
        *)
            echo "Invalid choice."
            exit 1
            ;;
    esac
}

if [[ "$INTERACTIVE_MODE" == "1" ]]; then
    interactive_mode
else
    case $1 in
        circle)
            calculate_circle $2
            ;;
        square)
            calculate_square $2
            ;;
        rectangle)
            calculate_rectangle $2 $3
            ;;
        *)
            display_help
            ;;
    esac
fi
