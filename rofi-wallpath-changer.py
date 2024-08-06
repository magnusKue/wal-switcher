# custom script that replaces the image path in my rofi config
# arg1 : File
# arg2 : Path to image

import sys

file=sys.argv[1]
target_str=sys.argv[2]
print(f"opening {file}")

try:
    with open(file, "r") as fp:
        lines=fp.readlines()
except:
    print(f"ERROR: Failed to read from {file}")
    sys.exit()

for index, line in enumerate(lines):
    if "background-image" in line:
        line_split = line.split('"')
        line_split[1] = f'"{target_str}"'
        lines[index] = "".join(line_split)
        print(lines[index])

# for line in lines:
#    print(line, end="")

#try:
with open(file, "w") as fp:
    fp.write("".join(lines))

#    print("SUCCESS: Wrote to filed")
#except:
#    print("ERROR: Failed to write file")
