#!/bin/bash
#
# A Max OSX shell script to copy the generated binary image of the current
# project to the ISP virtual USB disk. Can be added to lpcxpresso as an
#  external tool that builds the project before running this script.
#

echo "Working directory: $PWD"

# Set lpcxpresso to provide these two variables with the name and
# absolute path of the current project.

# E.g. 'hello_world'
project_name="$1"

# Absolute path to project's root.
project_loc="$2"

# E.g. 'Debug'
config_name="$3"

echo
echo "Project name: [${project_name}]"
echo "Project loc: [${project_loc}]"
echo "Config name: [${config_name}]"

# Binary file generated by lpcxpresso.
src="${project_loc}/${config_name}/${project_name}.bin"

# Location of the firmware file in the USB ISP virtual disk.
dst="/Volumes/CRP DISABLD/firmware.bin"

echo "Will copy ${src} to ${dst}"

while [ ! -f "${dst}" ]
do
  echo
  echo "Waiting for ${dst}"
  ls -l "${dst}"
  sleep 2
done

echo
ls -l "${dst}"
echo "Copying ..."
cp "${src}" "${dst}"
ls -l "${dst}"
echo "Exiting."

