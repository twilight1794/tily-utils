import sys
from subprocess import Popen
from subprocess import PIPE
argc=len(sys.argv)
def funcConsole(a, b):
	try:
		c=open(b,"rb")
		print ("     /"+"-".center(len(a),"-")+"\\")
		print ("     |"+a+"|")
		print ("     \\"+"-".center(len(a),"-")+"/")
		print ("      \\ |")
		print ("       \\|")
		print ("         .")
		#for f in c.readlines():
		#	print (f)
		if sys.platform == "win32":
			com = ["type",b]
		else:
			com = ["cat",b]
		pr = Popen(com, stdout=PIPE)
		li = pr.stdout.read()
		print li
		pr.stdout.close()
		c.close()
	except:
		print ("No found file")
		return 2 # return 2 : File Not Exist
def funcUser():
	x=raw_input("Text to show: ")
	y=raw_input("Path of the file of the picture: ")
	funcConsole(x,y)
if argc==1:
	funcUser()
elif argc!=3:
	sys.exit(1) # return 1 : Incorrect Parameters
else:
	funcConsole(sys.argv[1],sys.argv[2])