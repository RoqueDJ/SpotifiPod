# SpotifiPod Nintendo DS Makefile

TARGET      := SpotifiPod
SOURCES     := source
DATA        := data

# Use libnds for Nintendo DS development
LIBS        := -lnds

# DevkitPro environment variables (already set in container)
DEVKITPRO   ?= /opt/devkitpro

# Include DS rules from libnds
include $(DEVKITPRO)/libnds/devkitARM/ds_rules

# Automatically find all .c files
CFILES      := $(wildcard $(SOURCES)/*.c)
OFILES      := $(CFILES:.c=.o)

# Default target
all: $(TARGET).nds

# Build the .nds ROM
$(TARGET).nds: $(OFILES)
	$(CC) $(OFILES) -o $(TARGET).elf $(LDFLAGS)
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).nds

# Compile each .c file to .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -f $(OFILES) $(TARGET).elf $(TARGET).nds
