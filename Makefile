#---------------------------------------------------------------------------------
# SpotifiPod Nintendo DS Makefile
#---------------------------------------------------------------------------------

TARGET      := SpotifiPod
BUILD       := build
SOURCES     := source
DATA        := data
INCLUDES    :=

LIBS        := -lnds9

#---------------------------------------------------------------------------------

export DEVKITPRO ?= /opt/devkitpro
export DEVKITARM ?= $(DEVKITPRO)/devkitARM

include $(DEVKITPRO)/libnds/default_arm9_rules

#---------------------------------------------------------------------------------

CFILES      := $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.c)))
OFILES      := $(CFILES:.c=.o)

#---------------------------------------------------------------------------------

all: $(TARGET).nds

$(TARGET).nds: $(OFILES)
	$(CC) $(OFILES) -o $(TARGET).elf $(LDFLAGS)
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).nds

%.o: $(SOURCES)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o *.elf *.nds
