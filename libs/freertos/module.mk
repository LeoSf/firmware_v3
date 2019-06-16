ifeq ($(USE_FREERTOS),y)

FREERTOS_BASE=libs/freertos
SRC+=$(FREERTOS_BASE)/MemMang/heap_$(FREERTOS_HEAP_TYPE).c

INCLUDES += -I$(FREERTOS_BASE)/include/private
INCLUDES += -I$(FREERTOS_BASE)/include
INCLUDES += -I$(FREERTOS_BASE)/Supporting_Functions/inc

DEFINES+=USE_FREERTOS
DEFINES+=TICK_OVER_RTOS

SRC+=$(wildcard $(FREERTOS_BASE)/source/*.c)
SRC+=$(wildcard $(FREERTOS_BASE)/source/portable/*.c)
SRC+=$(wildcard $(FREERTOS_BASE)/Supporting_Functions/src/*.c)

ifeq ($(USE_FPU),y)
INCLUDES += -I$(FREERTOS_BASE)/source/portable/ARM_CM4F
SRC+=$(FREERTOS_BASE)/source/portable/ARM_CM4F/port.c
else
INCLUDES += -I$(FREERTOS_BASE)/source/portable/ARM_CM3
SRC+=$(FREERTOS_BASE)/source/portable/ARM_CM3/port.c
endif

endif
