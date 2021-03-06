#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Industrial Dual 0-20mA Bricklet

# Get threshold callbacks with a debounce time of 10 seconds (10000ms)
tinkerforge call industrial-dual-0-20ma-bricklet $uid set-debounce-period 10000

# Handle incoming current reached callbacks
tinkerforge dispatch industrial-dual-0-20ma-bricklet $uid current-reached &

# Configure threshold for current (sensor 1) "greater than 10 mA"
tinkerforge call industrial-dual-0-20ma-bricklet $uid set-current-callback-threshold 1 threshold-option-greater 10000000 0

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
