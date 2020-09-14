CFLAGS := -O2 -Wall -Wextra -Werror -std=c99 -pedantic -g3
OBJEXT := o
EXEOUT := -o

SRCDIR := src
INCDIR := inc
SLASH := /

ifdef VSCMD_VER
	CC := cl
	OBJEXT := obj
	EXEOUT := /Fe
	CFLAGS := /nologo /GL /O2 /Ob2 /Ot /GF /GT /Oi /MT /D_UNICODE /DUNICODE \
		/I$(INCDIR)
	LDFLAGS = /link /OUT:"$@.exe" /LTCG /SUBSYSTEM:CONSOLE
	RM := del
	BLANK :=
	SLASH := \$(BLANK)
endif

SOURCES := ed25519.c edsign.c f25519.c fprime.c sha512.c base64.c main.c
SOURCES := $(addprefix $(SRCDIR)$(SLASH),$(SOURCES))
OBJECTS := $(SOURCES:.c=.$(OBJEXT))

all: usign
usign: $(OBJECTS)
	$(CC) $(CFLAGS) $(EXEOUT)$@ $^ $(LDFLAGS) $(LDLIBS)

%.obj: %.c
	$(CC) $(CFLAGS) /Fo$@ /c /TC $^

clean:
	$(RM) $(SOURCES:.c=.o*)

install: usign
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin/
	$(INSTALL) -m 644 usign $(DESTDIR)$(PREFIX)/bin/
