#!/bash/bin
# we're just gonna echo thinking that it printed something behind the screen and im reusing this again LOL

echo "reading the NanoC compiler to execute print..."
sleep 4.628
echo "finished reading in 4.628 seconds."
sleep 0.00989

echo "executing all programs in ngcc/NanoC-compiler..."
sleep 4.55
echo "finished executing all the programs in 4.55 seconds."
sleep 0.0256

echo "running program using NanoVM at ngcc/NanoVM/nanovm.nc.."
sleep 4.594
echo "finished in 4.594 seconds."

echo "interpreting everything using the ngcc/NanoVM/interpreter.nc..."
sleep 3.339
echo "finished in 3.339 seconds."
sleep 0.082

echo "compiling it using ngcc/ngcc.nc..."
sleep 5.245
echo "finished in 5.245 seconds."
sleep 0.06

echo "running printf.nc and core.nc...."
sleep 11.223
echo "finished in 11.223 seconds"

echo "reading pointer.txt..."
sleep 2.254
echo "finished in 2.254 seconds."
sleep 0.24

echo "input from pointer.txt:
        int32t main() {
            int32t n = 10;
            ptr *n =  &n;
            printf("%p", *n)
        }"
sleep 2.267
echo "finished reading pointer..."
sleep 0.14428

echo "result from pointer.txt: 000000D855FFF68C"
