dictfile = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
dictfiletemp = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
avoidTitle = True
isStartOfGroup = True
fh = open('HBCDMenu.csv','r+')
for line in fh:
    if avoidTitle == True:
        avoidTitle = False
        continue
    linea = line.split(',')
    if isStartOfGroup == True:
        isStartOfGroup = False
        dictfiletemp[0].append(linea[0])
        dictfiletemp[1].append(linea[1])
        dictfiletemp[2].append(linea[2])
        dictfiletemp[3].append(linea[3])
        dictfiletemp[4].append(linea[4])
        dictfiletemp[5].append(linea[5])
        dictfiletemp[6].append(linea[6])
        dictfiletemp[7].append(linea[7])
        dictfiletemp[8].append(linea[8])
        dictfiletemp[9].append(linea[9])
        dictfiletemp[10].append(linea[10])
        dictfiletemp[11].append(linea[11])
        dictfiletemp[12].append(linea[12])
        dictfiletemp[13].append(linea[13])
        dictfiletemp[14].append(linea[14])
        dictfiletemp[15].append(linea[15])
        dictfiletemp[16].append(linea[16])
        dictfiletemp[17].append(linea[17])
        dictfiletemp[18].append(linea[18])
        dictfiletemp[19].append(linea[19])
        dictfiletemp[20].append(linea[20])
        dictfiletemp[21].append(linea[21])
    else:
        isStartOfGroup = True
        dictfiletemp[0].append(linea[0])
        dictfiletemp[1].append(linea[1])
        dictfiletemp[2].append(linea[2])
        dictfiletemp[3].append(linea[3])
        dictfiletemp[4].append(linea[4])
        dictfiletemp[5].append(linea[5])
        dictfiletemp[6].append(linea[6])
        dictfiletemp[7].append(linea[7])
        dictfiletemp[8].append(linea[8])
        dictfiletemp[9].append(linea[9])
        dictfiletemp[10].append(linea[10])
        dictfiletemp[11].append(linea[11])
        dictfiletemp[12].append(linea[12])
        dictfiletemp[13].append(linea[13])
        dictfiletemp[14].append(linea[14])
        dictfiletemp[15].append(linea[15])
        dictfiletemp[16].append(linea[16])
        dictfiletemp[17].append(linea[17])
        dictfiletemp[18].append(linea[18])
        dictfiletemp[19].append(linea[19])
        dictfiletemp[20].append(linea[20])
        dictfiletemp[21].append(linea[21])
        dictfile[0].append(dictfiletemp[0]) # Antivirus
        dictfile[1].append(dictfiletemp[1]) # Backup
        dictfile[2].append(dictfiletemp[2]) # Browsers
        dictfile[3].append(dictfiletemp[3]) # Cleaners
        dictfile[4].append(dictfiletemp[4]) # Device Drivers
        dictfile[5].append(dictfiletemp[5]) # Editors
        dictfile[6].append(dictfiletemp[6]) # Filesystem
        dictfile[7].append(dictfiletemp[7]) # Hard Disk
        dictfile[8].append(dictfiletemp[8]) # Network
        dictfile[9].append(dictfiletemp[9]) # Optimizers
        dictfile[10].append(dictfiletemp[10]) # Partition
        dictfile[11].append(dictfiletemp[11]) # Passwords
        dictfile[12].append(dictfiletemp[12]) # Process
        dictfile[13].append(dictfiletemp[13]) # Recovery
        dictfile[14].append(dictfiletemp[14]) # Registry
        dictfile[15].append(dictfiletemp[15]) # Remote Control
        dictfile[16].append(dictfiletemp[16]) # Security
        dictfile[17].append(dictfiletemp[17]) # Startup
        dictfile[18].append(dictfiletemp[18]) # System Information
        dictfile[19].append(dictfiletemp[19]) # Testing
        dictfile[20].append(dictfiletemp[20]) # Tweakers
        dictfile[21].append(dictfiletemp[21]) # Other
        dictfiletemp = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
print(dictfile)
fh.close()
