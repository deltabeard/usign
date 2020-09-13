CFLAGS := -O2 -Wall -Wextra -Werror -std=c99 -pedantic -g3
OBJEXT := o
EXEOUT := -o

ifdef VSCMD_VER
	CC := cl
	OBJEXT := obj
	EXEOUT := /Fe
	CFLAGS := /nologo /GL /O2 /Ob2 /Ot /GF /GT /Oi /MT /D_UNICODE /DUNICODE
	LDFLAGS = /link /OUT:"$@.exe" /LTCG /SUBSYSTEM:CONSOLE
	RM := del
endif

SOURCES := ed25519.c edsign.c f25519.c fprime.c sha512.c base64.c main.c
OBJECTS := $(SOURCES:.c=.$(OBJEXT))

all: usign
usign: $(OBJECTS)
	$(CC) $(CFLAGS) $(EXEOUT)$@ $^ $(LDFLAGS) $(LDLIBS)

%.obj: %.c
	$(CC) $(CFLAGS) /Fo$@ /c /TC $^

clean:
	$(RM) $(OBJECTS)
