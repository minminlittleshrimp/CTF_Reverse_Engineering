DIR_=.
SRC_DIR_ = $(DIR_)/src
SRC_ = $(SRC_DIR_)/*.c
HEADER_DIR_ = $(DIR_)/include
HEADER_ = $(DIR_)/include/*.h
CC=gcc
CFLAGS += -I$(DIR_)/include
CFLAGS += -g -Wall -Wextra

.SILENT:
all: guess.o reader.o
	echo "Secret compilation!"
	echo "Hidden compiling process ..."
	$(CC) $(CFLAGS) -o reader guess.o reader.o
	#rm -f *.o
	echo "Now running the guessing process ..."
	./reader

guess.o: $(SRC_) $(HEADER_)
	$(CC) $(CFLAGS) -c $(SRC_DIR_)/guess.c

reader.o: $(SRC_) $(HEADER_)
	$(CC) $(CFLAGS) -c $(SRC_DIR_)/reader.c

.PHONY: clean
clean:
	rm -f reader *.o
