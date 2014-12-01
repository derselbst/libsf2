# Points to C++ compiler, use C++11 standard
CPPC=g++ -std=gnu++11
# Points to C compiler, use C99 standard
CC=gcc -std=c99

LD=g++

# Parameters used for compilation
FLAGS=-Wall -fdata-sections -ffunction-sections -Os -fmax-errors=5
# Additional parameters used for linking whole programs
WHOLE=-s -fwhole-program -static

all: sf2.o midi.o main.o

midi.o: midi.cpp midi.hpp
	$(CPPC) $(FLAGS) -c midi.cpp -o midi.o

sf2.o : sf2.cpp sf2.hpp sf2_types.hpp sf2_chunks.hpp
	$(CPPC) $(FLAGS) -c sf2.cpp -o sf2.o

main.o: main.cpp
	$(CPPC) $(FLAGS) -c main.cpp -o main.o
	$(LD) main.o sf2.o midi.o -o asdf

clean:
	rm -f *.o *.s *.i *.ii asdf