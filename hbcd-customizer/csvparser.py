#!/usr/bin/env python3
#-*- coding: utf8 -*-

class HBCDList(object):
    def __init__(self, filedump):
        self.filedump = filedump
        self.Antivirus = []
        self.Backup = []
        self.Browsers = []
        self.Cleaners = []
        self.DeviceDrivers = []
        self.Editors = []
        self.Filesystem = []
        self.HardDisk = []
        self.Network = []
        self.Optimizers = []
        self.Partition = []
        self.Passwords = []
        self.Process = []
        self.Recovery = []
        self.Registry = []
        self.RemoteControl = []
        self.Security = []
        self.Startup = []
        self.SystemInformation = []
        self.Testing = []
        self.Tweakers = []
        self.Other = []
        self.avoidTitle = True
        self.isPath = False
    def parse(self):
        tempname = []
        temppath = []
        tempzip = ''
        for lineraw in self.filedump:
            if self.avoidTitle:
                self.avoidTitle = False
                continue
            line = lineraw.split(',')
            if not self.isPath:
                for linename in line:
                    if linename == '\n':
                        tempname.append('')
                    else:
                        tempname.append(linename)
                self.isPath = True
            elif self.isPath == True:
                for linepath in line:
                    if linepath == '\n':
                        temppath.append('')
                    else:
                        temppath.append(linepath)
                self.isPath = None
            else:
                zipped = list(zip(tempname, temppath))
                self.Antivirus = []
                self.Backup = []
                self.Browsers = []
                self.Cleaners = []
                self.DeviceDrivers = []
                self.Editors = []
                self.Filesystem = []
                self.HardDisk = []
                self.Network = []
                self.Optimizers = []
                self.Partition = []
                self.Passwords = []
                self.Process = []
                self.Recovery = []
                self.Registry = []
                self.RemoteControl = []
                self.Security = []
                self.Startup = []
                self.SystemInformation = []
                self.Testing = []
                self.Tweakers = []
                self.Other = []
                self.isPath = False
    def __str__(self):
        p = ''
        for i in self.Tweakers:
            for j in i:
                global p
                p = p + j
        return p
    def genHTML(self):
        pass

class HBCDProg(object):
    def __init__(self, name, executable):
        self.name = name
        self.executable = executable
    def __str__(self):
        return self.name

csvfile = open('HBCDMenu.csv','r+')
myhbcdlist = HBCDList(csvfile.readlines())
myhbcdlist.parse()
csvfile.close()
