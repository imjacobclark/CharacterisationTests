COMPILER=sbcl
FLAGS=--noinform
ENTRY=main.cl
TEST=test/assert.cl
OUTPUT=main
BINDIR=build/

default: build
test: build capture all_tests clean

build:
	echo "\n\nCompiling ${ENTRY}" && mkdir build; $(COMPILER) $(FLAGS) --load $(ENTRY) --eval "(sb-ext:save-lisp-and-die \"$(BINDIR)$(OUTPUT)\" :toplevel #'main :executable t)" --eval "(quit)" > /dev/null

capture:
	echo "\n\nCapturing test output" && ./build/main > tmp.txt && tr -d '\n' < tmp.txt > capture.txt

all_tests:
	echo "\n\nRunning tests: ${TEST}" && $(COMPILER) $(FLAGS) --load $(ENTRY) --load $(TEST) --eval "(assertion (main))" --eval "(quit)" 2> /dev/null | tail -n 1 && echo "\n\n"

clean: 
	echo "Cleaning up" && rm -rf tmp.txt capture.txt ./build