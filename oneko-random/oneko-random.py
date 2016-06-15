from subprocess import Popen
from subprocess import call
from random import randint
import sys
arg = sys.argv
if sys.platform != "linux2":
	print ("oneko-random detects your system isn't linux")
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
# Invert Color
try:
	if arg.index("-v") or arg.index("--rvideo"):
		rvideo = randint(0,1)
	if rvideo == 1:
		rvideo = "-rv&"
		command = ["oneko",char,rvideo]
	else:
		command = ["oneko",char]
except:
	rvideo = ""
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
	bgcolor = "-fg white"
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
	fgcolor = "-fg black"
# Create command
try:
	command = Popen(["oneko",char,bgcolor,fgcolor,rvideo,"&"])
	command.wait()
	exit(0)
except:
	print ("oneko")
	exit(1) # Error 1: Oneko not installed in the system
