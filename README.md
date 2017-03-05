# CharacterisationTests
Characterisation Tests


### Common Lisp (and a Makefile)

* Capture output from main into capture.txt 
* Executes assert to test the captured output matches the current output

Will return `T` within `Running tests` section of `make` output if assertions passed or `NIL` if it failed.

In a real world scenario you'd only execute the capture task once rather than on each build.

Running:

```shell
$ brew install sbcl
$ git clone git@github.com:imjacobclark/CharacterisationTests.git && cd lisp
$ make
```

Sample output:

```
[jacobclark:.../CharacterisationTests/lisp]$ make test                                                                                                                 (master✱) 
echo "\n\nCompiling main.cl" && mkdir build; sbcl --noinform --load main.cl --eval "(sb-ext:save-lisp-and-die \"build/main\" :toplevel #'main :executable t)" --eval "(quit)" > /dev/null


Compiling main.cl
echo "\n\nCapturing test output" && ./build/main > tmp.txt && tr -d '\n' < tmp.txt > capture.txt


Capturing test output
echo "\n\nRunning tests: test/assert.cl" && sbcl --noinform --load main.cl --load test/assert.cl --eval "(assertion (main))" --eval "(quit)" 2> /dev/null | tail -n 1 && echo "\n\n"


Running tests: test/assert.cl
T 


echo "Cleaning up" && rm -rf tmp.txt capture.txt ./build
Cleaning up
```

#### Known issues

There is some weirdness in how the lists are being passed around, too many lists in lists - I'll take another look at some point.