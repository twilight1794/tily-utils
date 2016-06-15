from subprocess import call
from random import randint
import sys
arg = sys.argv
''' Checking system
if sys.platform != "linux2":
    print ("linux2")
    exit (2) # Error 2: oneko-random only supports Linux systems'''
# Character
char = randint(1,5)
if char == 1:
    char = "-tora"
elif char == 2:
    char = "-dog"
elif char == 3:
    char = "-sakura"
elif char == 4:
    char = "-tomoyo"
elif char == 5:
    char = "-neko"
# Background Color
try:
    if arg.index("-c") or arg.index("--bgcolor"):
	bgcolor = randint(1,5)
    if bgcolor == 1:
        bgcolor = "-bg red"
    elif bgcolor == 2:
        bgcolor = "-bg green"
    elif bgcolor == 3:
        bgcolor = "-bg blue"
    elif bgcolor == 4:
        bgcolor = "-bg black"
    elif bgcolor == 5:
        bgcolor = "-bg white"
except:
    bgcolor = ""
# Foreground Color
try:
    if arg.index("-f") or arg.index("--fgcolor"):
	fgcolor = randint(1,5)
    if fgcolor == 1:
        fgcolor = "-fg red"
    elif fgcolor == 2:
    	fgcolor = "-fg green"
    elif fgcolor == 3:
	fgcolor = "-fg blue"
    elif fgcolor == 4:
	fgcolor = "-fg black"
    elif fgcolor == 5:
	fgcolor = "-fg white"
except:
	fgcolor = ""
# Invert Color
try:
    if arg.index("-v") or arg.index("--rvideo"):
        rvideo = randint(0,1)
	rvideo = "-rv"
except:
    rvideo = ""
# Create command
command = ["oneko",char,bgcolor,fgcolor,rvideo]
try:
    print (command)
    call(command)
    exit(0)
except:
    print ("oneko")
    exit(1) # Error 1: Oneko not installed in the system
