# were using GPT code for now... #
import re
import argparse

def transpile_nanocpp(npp_file, output_file):
    with open(npp_file, "r") as f:
        src_code = f.read()

    # Remove fake namespace define
    src_code = re.sub(r'#define\s+namespace::std', '', src_code)

    # Replace cout << "text" << endl; with nano.printf("text\n");
    # Handles simple cases only (no variables or expressions)
    def cout_replacer(match):
        text = match.group(1)
        return f'std::cout << "{text}" << std::endl;'

    src_code = re.sub(r'cout\s*<<\s*"(.+?)"\s*<<\s*endl\s*;', cout_replacer, src_code)

    # Replace #include <iostream.nh> with fake header include
    src_code = re.sub(r'#include\s+<iostream\.nh>', '#include <iostream>', src_code)

    # Optionally, handle int32t → int
    src_code = re.sub(r'\bint32t\b', 'int', src_code)

    # Write transpiled C/NanoC code
    with open(output_file, "w") as f:
        f.write(src_code)

    print(f"[TRANSPILER] {npp_file} → {output_file} complete!")

# Example usage
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="NanoC -> C transpiler")
    parser.add_argument("npp_file", nargs='?', default="test.npp", help="NanoC++ source file (.npp) to transpile")

    args = parser.parse_args()
    nc_file = args.npp_file
    c_file = nc_file.replace(".npp", ".cpp")
    transpile_nanocpp("test.npp", "test_transpiled.cpp")
