CC=gcc
CFLAGS=-Wall -Wpedantic
LIBS=-lm
DEPS = stack.h amstrong.h
OBJ = stack.o amstrong.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

is_amstrong_number: $(OBJ) main.o
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

all: is_amstrong_number

clean: clean-doc clean-test clean-cppcheck
	rm -rf $(OBJ) is_armstrong_number
	rm -rf test/build/is_amstrong_number

clean-doc:
	rm -rf html/ latex/
clean-test:
	rm -f test/report/*.xml
clean-cppcheck:
	rm -rf cppcheck.xml
	
doc: clean-doc 
	doxygen

cppcheck:
	cppcheck --enable=all --inconclusive --error-exitcode=1 *.c

cppcheck-xml:
	cppcheck --xml --xml-version=2 . 2> cppcheck.xml

tests: clean amstrong.o stack.o
	gcc test/amstrong/is_amstrong_number.c amstrong.o stack.o -lm -lcmocka -o test/build/is_amstrong_number
	CMOCKA_MESSAGE_OUTPUT=stdout CMOCKA_XML_FILE='' ./test/build/is_amstrong_number 

tests-xml: clean amstrong.o stack.o
	gcc test/amstrong/is_amstrong_number.c amstrong.o stack.o -lm -lcmocka -o test/build/is_amstrong_number
	CMOCKA_XML_FILE=test/report/%g.xml CMOCKA_MESSAGE_OUTPUT=xml ./test/build/is_amstrong_number 