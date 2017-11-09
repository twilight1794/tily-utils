#!/usr/bin/env python3
#-*-coding: utf-8 -*-
import os, sys, csv, re

ERR = {
    "NOPARAM": (1),
    "NOENOUGHPARAM": (2),
    "NOGROUPCODE": (3),
    "NOHBCDMENU": (4),
    "NOCOMRPESSFORMAT": (5),
    "NOPROGDIR": (6),
    "NOPERM": (7),
    "UNDEF": (8),
    "DIRNOEXIST": (9),
    "PROGRAMNOEXIST": (10),
    "WRONGTYPEVAR": (11),
}

def help(topic):
    pass

def userSteps():
    print ("Welcome to HBCD Customizer 1.0")
    name = input("What's the name of your program?")
    print("##Grouplist")
    group = input("In what group do you set your program?")
    try:
        group = int(group)
    except ValueError:
        return ERR["WRONGTYPEVAR"](0)
    if group > 25:
        return ERR["NOGROUPCODE"](0)
    HBCD = input("What is the path in what is saved HBCD?")
    HBCDMenu = HBCD + "/HBCD/Programs/HBCDMenu.csv"
    if os.path.exists(C) == False:
        return ERR["DIRNOEXIST"](0)
    if os.path.isabs(HBCDMenu) == False:
        HBCDMenu = os.path.abspath(HBCDMenu)
    if os.path.access(HBCDMenu) == False:
        return ERR["NOPERM"](0)
    if os.path.isfile(HBCDMenu) == False:
        return ERR["NOHBCDMENU"](0)
    directory = input("What is the path in what is saved your program?")
    if os.path.exists(directory) == False:
        return ERR["NOPROGDIR"](0)
    if os.path.access(directory) == False:
        return ERR["NOPERM"](0)
    if os.path.isabs(directory) == False:
        directory = os.path.abspath(directory)
    print("Choose any compress format:")
    print("1-zip 2-cab 3-uha 4-paq 5-7z")
    compress = input("> ")
    try:
        compress = int(compress)
    except ValueError:
        return ERR["WRONGTYPEVAR"](0)
    if group > 5:
        return ERR["NOCOMPRESSFORMAT"](0)
    filepath = input("What is the executable file? Type only the file name:")
    filepath = directory + filepath
    if os.path.exists(filepath) == False:
        return ERR["PROGRAMNOEXIST"](0)
    if os.path.access(directory) == False:
        return ERR["NOPERM"](0)
    return do(name, group, HBCD, directory, compress, filepath)
def do(name, group, HBCD, directory, compress, filepath):
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
    try:
        x=funcBuild(a,b,c,d,e,f)
        return 0
    except:
        return x

if __name__ == "__main__":
    argv = sys.argv
    if len(argv) == 1:
        return ERR['NOPARAM'](0)
    elif re.match('(-h|--help)', argv[1]) and argv[2]:
        x = help(argv[2])
    elif re.match('(-h|--help)', argv[1]):
        x = help(0)
    elif re.match('(-u|--user)', argv[1]):
        x = userSteps()
    elif re.match('(-v|--version)', argv[1]):
        pass
    elif len(argv) == 8 and re.match('(-c|--console)', argv[1]):
        x = do(argv[2], argv[3], argv[4], argv[5], argv[6], argv[7])
    else:
        return ERR['NOENOUGHPARAM'](0)
    return x
