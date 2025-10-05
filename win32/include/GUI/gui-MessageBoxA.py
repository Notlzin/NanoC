import ctypes
from ctypes import wintypes

# constants
MB_OK = 0x0

# MessageBoxA functions
MessageBoxA = ctypes.windll.user32.MessageBoxA
MessageBoxA.argtypes = [wintypes.HWND, wintypes.LPCSTR, wintypes.LPCSTR, wintypes.UINT]
MessageBoxA.restype = wintypes.INT

# calling it
MessageBoxA(None, b"hi from NanoC MessageBoxA!", b"NanoC MessageBoxA LOL", MB_OK)
