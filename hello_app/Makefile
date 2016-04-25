APPNAME = hello
SRC = src/main.cpp

include ../Makefile.config

LIBRARY_PATH = -L$(MBED_SDK_PATH)/mbed/TARGET_$(TARGET)/TOOLCHAIN_$(TOOLCHAIN)
LIBRARIES = -lmbed -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys

APPOBJ_ = $(subst src,build,$(SRC))
APPOBJ__ = $(APPOBJ_:.c=.o)
APPOBJ = $(APPOBJ__:.cpp=.o)

all: __INIT__ bin/$(APPNAME).bin

__INIT__:
	mkdir -p bin build

bin/$(APPNAME).bin: build/$(APPNAME).elf
	$(OBJCOPY) -O binary $< $@

build/$(APPNAME).elf: $(APPOBJ)
	$(CC) $(LDOPT) $(LDOBJ) $? $(LIBRARIES) $(LIBRARY_PATH) -o $@

build/%.o: src/%.cpp
	echo $<
#	$(CC) -S $(INCLUDE) $(CCOPT) $< 
	$(CC) $(INCLUDE) $(CCOPT) $< -o $@

build/%.o: src/%.c
	$(CC) $(INCLUDE) $(COPT) $< -o $@

install: bin/$(APPNAME).bin
	cp bin/$(APPNAME).bin $(MBEDPATH)

clean:
	rm -rf bin build *~ *.o
