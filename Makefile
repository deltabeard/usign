CFLAGS := -O2 -Wall -Wextra -Werror -std=c99 -pedantic -g3

SOURCES := ed25519.c edsign.c f25519.c fprime.c sha512.c base64.c main.c
OBJECTS := $(SOURCES:.c=.o)

all: usign
usign: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

clean:
	$(RM) $(OBJECTS)
