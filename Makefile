#---------------------------------------------------------------------------------
# SpotifiPod Nintendo DS Makefile
#---------------------------------------------------------------------------------

TARGET	:= SpotifiPod
BUILD	:= build
SOURCES	:= source
INCLUDES:=

LIBS	:= -lnds

#---------------------------------------------------------------------------------

DEVKITPRO ?= /opt/devkitpro

include $(DEVKITPRO)/libnds/devkitARM/ds_rules

#---------------------------------------------------------------------------------

CFILES := $(wildcard $(SOURCES)/*.c)
OFILES := $(CFILES:.c=.o)

#---------------------------------------------------------------------------------

all: $(TARGET).nds

$(TARGET).nds: $(OFILES)
	$(CC) $(OFILES) -o $(TARGET).elf $(LDFLAGS)
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).nds

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OFILES) $(TARGET).elf $(TARGET).nds
