import subprocess
import random
import sys
arg = sys.argv
o = c = f = v = 0
character = random.randint(0,4)
try:
	if arg.index("-c") or arg.index("--bgcolor"):
		bgcolor = random.randint(0,4)
except:
	bgcolor = 9
try:
	if arg.index("-f") or arg.index("--fgcolor"):
		fgcolor = random.randint(0,4)
except:
	fgcolor = 9
try:
	if arg.index("-v") or arg.index("--rvideo"):
		rvideo = random.randint(0,1)
except:
	rvideo = 0
# Character
if o == 1:
	o = "-tora"
elif o == 2:
	o = "-dog"
elif o == 3:
	o = "-sakura"
elif o == 4:
	o = "-tomoyo"
elif o == 0:
	o = "-neko"
# Background Color
if c == 1:
	c = "-bg red"
elif c == 2:
	c = "-bg green"
elif c == 3:
	c = "-bg blue"
elif c == 4:
	c = "-bg black"
elif c == 0:
	c = "-bg white"
# Foreground Color
if f == 1:
	f = "-fg red"
elif f == 2:
	f = "-fg green"
elif f == 3:
	f = "-fg blue"
elif f == 4:
	f = "-fg black"
elif f == 0:
	f = "-fg white"
# Invert Color
if v == 1:
	v = "-rv"
elif v == 0:
	v = ""
command = ["oneko",o,c,f,v]
try:
	subprocess.call(command)
	print ("ggg")
except:
	print ("fff")
	exit (1)
