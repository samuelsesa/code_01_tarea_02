CCP_FLAGS=-Wall -Wpedantic
all: is_amstrong_number

is_amstrong_number : main.o stack.o amstrong.o doc
	gcc $(CCP_FLAGS) main.o stack.o amstrong.o -o is_armstrong_number -lm 

%.o: %.c %.h $(DEPS)
	gcc $(CCP_FLAGS) -c -o $@ $<

clean: clean-doc clean-test
	rm -rf main.o stack.o amstrong.o is_armstrong_number
	rm -rf cppcheck.xml
	rm -rf test/build/is_amstrong_number

clean-doc:
	rm -rf html/ latex/
clean-test:
	rm -f test/report/*.xml

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