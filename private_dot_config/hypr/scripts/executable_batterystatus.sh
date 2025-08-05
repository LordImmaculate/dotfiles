#!/usr/bin/zsh

echo $(acpi -b | sed -E 's/Battery [0-9]+: ([^,]+), ([^,]+), (.*) until charged/\2, \1, Full in \3/')
