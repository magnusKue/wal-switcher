# custom script that replaces the image path in my rofi config
# arg1 : File
# arg2 : Path to image

import sys

file=sys.argv[1]
print(f"opening {file}")

try:
    with open(file, "r") as fp:
        lines=fp.readlines()
except:
    print(f"ERROR: Failed to read from {file}")
    sys.exit()

for index, line in enumerate(lines):
    if "path" in line:
        line_split = line.split('=')
        print(line_split)
        line_split[1] = f'= {sys.argv[2]}'
        lines[index] = str("".join(line_split))+"\n" 
        print(lines[index])
        break

#for line in lines:
#   print(line, end="")

#try:
with open(file, "w") as fp:
    fp.write("".join(lines))

#    print("SUCCESS: Wrote to filed")
#except:
#    print("ERROR: Failed to write file")
