VERSION = 0.01
CC      = /usr/bin/g++
CFLAGS  = -Wall -g -O3 -D_REENTRANT -DVERSION=\"$(VERSION)\"
LDFLAGS = -lzmq

OBJ_SERVER = server.o
BIN_SERVER = server
OBJ_CLIENT = client.o
BIN_CLIENT = client
OBJ = $(OBJ_SERVER) $(OBJ_CLIENT)

all:	server client

server: $(OBJ)
	$(CC) $(CFLAGS) -o $(BIN_SERVER) $(OBJ_SERVER) $(LDFLAGS)

client: $(OBJ)
	$(CC) $(CFLAGS) -o $(BIN_CLIENT) $(OBJ_CLIENT) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -rf $(BIN_SERVER) $(BIN_CLIENT) $(OBJ) $(OBJ_SERVER) $(OBJ_CLIENT)

