import ctypes # python c wrapper function
import sys # for command line

def changeBG(imagepath):
    ctypes.windll.user32.SystemParametersInfoW(20, 0, imagepath , 0)
    return

try:
    imagepath = sys.argv[1]
    changeBG(imagepath)
except:
    print("Couldn't find filepath")
