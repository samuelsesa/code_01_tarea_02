CCP_FLAGS=-Wall -Wpedantic
is_amstrong_number : main.o doc
	gcc $(CCP_FLAGS) main.o -o is_armstrong_number -lm 
	echo COMPILACIÓN CORRECTA
main.o : main.c
	gcc $(CCP_FLAGS) -c main.c
clean: clean-doc
	rm -rf main.o is_armstrong_number
	rm -rf cppcheck.xml
clean-doc:
	rm -rf html/ latex/
doc: clean-doc
	doxygen
cppcheck:
	cppcheck --enable=all --inconclusive --error-exitcode=1 *.c
cppcheck-xml:
	cppcheck --xml --xml-version=2 . 2> cppcheck.xml
