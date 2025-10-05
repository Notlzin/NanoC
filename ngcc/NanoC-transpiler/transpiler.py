# transpiler.py

import argparse
import re

def transpiler(nc_file, c_file):
    with open(nc_file, "r") as f:
        src_code = f.read()

    # replacement from int32t -> int
    src_code = re.sub(r'\bint32t\b', 'int', src_code)

    # replacing nano.printf(arg) -> printf(arg)
    src_code = re.sub(r'nano\.printf', 'printf', src_code)

    # replaces .nh -> .h C headers
    src_code = re.sub(r'#include\s+<(.+?)\.nh>', r'#include "\1.h"', src_code)

    with open(c_file, "w") as f:
        f.write(src_code)

    print(f"transpiled {nc_file} -> {c_file}!")

# example usage:
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="NanoC -> C transpiler")
    parser.add_argument("nc_file", nargs='?', default="hello.nc", help="NanoC source file (.nc) to transpile")

    args = parser.parse_args()
    nc_file = args.nc_file
    c_file = nc_file.replace(".nc", ".c")

    transpiler("hello.nc", "hello.c")
