CCP_FLAGS=-Wall -Wpedantic
all: is_amstrong_number

is_amstrong_number : main.o doc
	gcc $(CCP_FLAGS) main.o stack.o -o is_armstrong_number -lm 

main.o : main.c stack.c stack.h
	gcc $(CCP_FLAGS) -c main.c
	gcc $(CCP_FLAGS) -c stack.c

clean: clean-doc
	rm -rf main.o stack.o is_armstrong_number
	rm -rf cppcheck.xml

clean-doc:
	rm -rf html/ latex/

doc: clean-doc
	doxygen

cppcheck:
	cppcheck --enable=all --inconclusive --error-exitcode=1 *.c

cppcheck-xml:
	cppcheck --xml --xml-version=2 . 2> cppcheck.xml
