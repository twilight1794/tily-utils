import sys
def funcHelp():
    g=1
def funcDeDiv(divisor, dividend):
    try:
        prueba = divisor/dividend
        if dividend == 0:
            return 0
        quotient = 0
        rest = [0,0,0,0,0,0,0,0,0,0]
        divisorl = divisor.split("")
        dividendl = dividend.split("")
    except ZeroDivisionError:
        print("ZeroDivisionError")
argc = len(sys.argv)
if argc == 1 and sys.argv[1] == "--help":
    funcHelp()
elif argc == 2 and sys.argv[1].isdigt() and sys.argv[2].isdigt():
    exit(funcDeDiv(sys.argv[1], sys.argv[2]))
