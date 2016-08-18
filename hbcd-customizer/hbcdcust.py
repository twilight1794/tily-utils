#-*-coding: utf-8 -*-
import os
import sys
import csv
# from PySide.QtGui import *
argc = len(sys.argv)
argv = sys.argv
def main():
	if argc == 1:
		return 1 # Err1: No parameters
	elif argc == 3 and argv[1] == "-h":
		x=funcHelp(argv[2])
	elif argc == 2 and argv[1] == "--help" and argv[1] == "-h":
		x=funcHelp(0)
	elif argv[1] == "-u":
		x=mainu()
		return x
	elif argc != 8:
		return 2 # Err2: No enough parameters
	else:
		a=argv[2]
		b=argv[3]
		c=argv[4]
		d=argv[5]
		e=argv[6]
		f=argv[7]
		if argv[1] == "-c":
			x=mainc(a,b,c,d,e,f)
			return x
		else:
			return 3 # Err3: No mode program defined
def mainc():
	a = funcCname()
	b = funcCgroup()
	c = funcCHBCD()
	d = funcCdir()
	e = funcCcomp()
	f = funcCfile()
	try:
		x=funcBuild(a,b,c,d,e,f)
		return 0
	except:
		return x
def mainu():
	print ("Welcome to Tily HBCD Customizer 1.0")
	prpt = raw_input("Do you are ready to start or visit the help? (y/n/h)")
	if  prpt=="y":
		print ("Well. Then, Start Now!!!")
	elif prpt=="h":
		help(0)
	else:
		sys.exit()
	a = funcUname()
	b = funcUgroup()
	c = funcUHBCD()
	d = funcUdir()
	e = funcUcomp()
	f = funcUfile()
	if b and c and d and e and f:
		try:
			x=funcBuild(a,b,c,d,e,f)
			print ("The operation has been completed successfully.")
		except:
			print ("Sorry, has ocurred an error in the program. :c")
		finally:
			sys.exit()
def funcHelp(a):
        xxxxc = q
def funcBuild(a,b,c,d,e,f):
	csv = open("HBCDMenu.csv","a+")
	cont = csv.read()
	csv.close()
	# Open CSV
	# Write in CSV
	# Open file
	# Move
	# Compress
	# Close file
	return 0
def funcUname():
	a=raw_input ("What is the name of your program?")
	return a
def funcUgroup():
	a=raw_input ("In what group do you set your program?")
	if a.isdigit() == False:
		return 13 # Err13: Wrong type var
	else:
		if a>25:
			return 4 # Err4: No groupcode defined
		else:
			return a
def funcUHBCD():
	a=raw_input ("What is the path that you saved HBCD?")
	try:
		b = a + "/HBCD/Programs/HBCDMenu.csv"
		if os.path.isabs(a) == False:
			a = os.path.abspath(a)
		elif os.path.exists(a) == False:
			return 11 # Err11: No exists directory or file
		elif os.path.access(a) == False:
			return 9 # Err9: No permisions
		elif os.path.isfile(b) == False:
			return 8 # Err7: No HBCD directory
		else:
			return a
	except:
		return 10 # Err10: Undefined issue
def funcUdir():
	a=raw_input ("What is the path that you saved your program?")
	try:
		b = a + "*.exe"
		if os.path.isabs(a) == False:
			a = os.path.abspath(a)
		elif os.path.exists(a) == False:
			return 11 # Err11: No exists directory or file
		elif os.path.access(a) == False:
			return 9 # Err9: No permisions
		elif os.path.isfile(b) == False:
			return 8 # Err8: No program directory
		else:
			return a
	except:
		return 10 # Err10: Undefined issue
def funcUcomp():
	print ("Choose any compress format:")
	print ("1-zip 2-cab 3-uha 4-paq 5-7z")
	a=input ("Input: ")
	if a.isdigit() == False:
		return 13 # Err13: Wrong type var
	elif a > 5:
		return 5 # Err5: No compress format defined
	else:
		return a
def funcUfile():
	a=input ("Your program is only an Exe (1), contains other files(2), or is a multiple-program, like Microsoft Office(3)")
	if a.isdigit() == False:
		return 13 # Err13: Wrong type var
	elif a > 3:
		return 5 # Err12: No type program defined
	else:
		return a
main = main()
sys.exit(main)
