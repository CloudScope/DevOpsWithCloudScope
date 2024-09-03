Objective:

In the script file calculate_area.sh already present on path /home/user write a script that calculates the area of various geometric shapes based on user input. The script should support multiple interaction modes, including a help menu, interactive input, and command-line arguments.
NOTE: In this assignment you might require usage of bc library. The bc command in Unix/Linux is an arbitrary precision calculator language that supports interactive execution of mathematical expressions. It is often used for performing high-precision arithmetic operations and evaluating complex expressions from the command line.

Script Requirements

TASK - 1:

Help Flag (-h)

When the script is run with the -h flag, it should display a help message detailing the types of areas it can calculate. Example areas include circles, squares, and rectangles.

INPUT:

./calculate_area.sh -h

OUTPUT:

Usage: ./calculate_area.sh [option] [shape] [dimension1] [dimension2]

Calculate the area of various geometric shapes.

Options:
-h Display this help message.
-i Interactive mode.

Shapes and dimensions:
circle radius Calculate the area of a circle.
square side Calculate the area of a square.
rectangle length width Calculate the area of a rectangle.

NOTE: Your script help flag should exactly match the above output, including the blank spaces.



TASK - 2:

Command Line Arguments

- If no flags are provided, the script should expect command-line arguments in the following format:

- ./calculate_area.sh shape dimension1 [dimension2]

- The shape should be a circle, square, or rectangle.

- dimension1 and dimension2 (if needed) should be the numerical values for the calculations.

INPUT 1:

./calculate_area.sh circle 5

OUTPUT 1:

Area of the circle: 78.53975

INPUT 2:

./calculate_area.sh rectangle 5 10

OUTPUT 2:

Area of the rectangle: 50



TASK - 3:

Interactive Mode (-i)

- Running the script with the -i flag should initiate an interactive mode where the script prompts the user to choose the type of area they wish to calculate.

- Based on the selected type, the script should then ask for the necessary dimensions:

- Circle: Request the radius.

- Square: Request the side length.

- Rectangle: Request the length and width.

INPUT:

./calculate_area.sh -i

OUTPUT:

Choose the shape to calculate the area:
1. Circle
2. Square
3. Rectangle
Enter your choice (1/2/3):

Enter choice: 1

Enter the radius of the circle:

Enter the radius: 5

Area of the circle: 78.53975


Ans:

#!/bin/bash

display_help() {
    echo "Usage: $0 [option] [shape] [dimension1] [dimension2]"
    echo
    echo "Calculate the area of various geometric shapes."
    echo
    echo "Options:"
    echo "  -h           Display this help message."
    echo "  -i           Interactive mode."
    echo
    echo "Shapes and dimensions:"
    echo "  circle radius       Calculate the area of a circle."
    echo "  square side         Calculate the area of a square."
    echo "  rectangle length width  Calculate the area of a rectangle."
}

calculate_area() {
    local shape=$1
    local dim1=$2
    local dim2=$3

    case $shape in
        circle)
            echo "Area of the circle: $(echo "scale=2; 3.14159 * $dim1 * $dim1" | bc)"
            ;;
        square)
            echo "Area of the square: $(echo "scale=2; $dim1 * $dim1" | bc)"
            ;;
        rectangle)
            echo "Area of the rectangle: $(echo "scale=2; $dim1 * $dim2" | bc)"
            ;;
        *)
            echo "Invalid shape: $shape"
            display_help
            exit 1
            ;;
    esac
}

interactive_mode() {
    echo "Choose the shape to calculate the area:"
    echo "1. Circle"
    echo "2. Square"
    echo "3. Rectangle"
    read -p "Enter your choice (1/2/3): " choice

    case $choice in
        1)
            read -p "Enter the radius of the circle: " radius
            calculate_area circle $radius
            ;;
        2)
            read -p "Enter the side length of the square: " side
            calculate_area square $side
            ;;
        3)
            read -p "Enter the length of the rectangle: " length
            read -p "Enter the width of the rectangle: " width
            calculate_area rectangle $length $width
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
}

if [ $# -eq 0 ]; then
    display_help
    exit 1
fi

while getopts "hi" opt; do
    case $opt in
        h)
            display_help
            exit 0
            ;;
        i)
            interactive_mode
            exit 0
            ;;
        *)
            display_help
            exit 1
            ;;
    esac
done

if [ $# -ge 2 ]; then
    shape=$1
    dim1=$2
    dim2=$3
    calculate_area $shape $dim1 $dim2
else
    display_help
    exit 1
fi
