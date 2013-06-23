CC=gcc
CFLAGS := -g -O2 -DUSE_OPENSSL
LDLIBS := -lcrypto

TARGETS = afptool img_maker img_unpack mkkrnlimg
SOURCES = afptool.c img_maker.c img_unpack.c mkkrnlimg.c
OBJECTS = afptool img_maker img_unpack mkkrnlimg
PREFIX=/usr/local/bin

all: $(TARGETS)
	
afptool:
	$(CC) $(CFLAGS) -o afptool afptool.c $(LDLIBS)
	
img_maker:
	$(CC) $(CFLAGS) -o img_maker img_maker.c $(LDLIBS)

img_unpack:
	$(CC) $(CFLAGS) -o img_unpack img_unpack.c $(LDLIBS)
	
mkkrnlimg:
	$(CC) $(CFLAGS) -o mkkrnlimg mkkrnlimg.c $(LDLIBS)
	
clean: 
	rm -rf $(OBJECTS) 
	
install:
	install -m 0755 afptool $(PREFIX)/afptool
	install -m 0755 img_maker $(PREFIX)/img_maker
	install -m 0755 img_unpack $(PREFIX)/img_unpack
	install -m 0755 mkkrnlimg $(PREFIX)/mkkrnlimg
