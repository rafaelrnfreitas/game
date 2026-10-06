CC := gcc
TARGET := game
SRC := ./src
INCLUDE := ./include
BUILD := ./build

SRCS := $(shell find $(SRC) -name '*.c')
OBJS := $(SRCS:%=$(BUILD)/%.o)
DEPS := $(OBJS:.o=.d)
IDIRS := $(shell find $(INCLUDE) -type d)
IFLAGS := $(addprefix -I, $(IDIRS))

CPPFLAGS := $(IFLAGS) -MMD -MP
CFLAGS := -Wall -Wextra -std=c11 -g -O0 -fno-omit-frame-pointer

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $@

$(BUILD)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(BUILD) $(TARGET)

-include $(DEPS)
