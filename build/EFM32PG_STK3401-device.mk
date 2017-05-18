# This target makefile was automatically generated by mbedUpdater.

# Device for which the code should be built.
MBED_DEVICE        := EFM32PG_STK3401

# Can skip parsing of this makefile if user hasn't requested this device.
ifeq "$(findstring $(MBED_DEVICE),$(DEVICES))" "$(MBED_DEVICE)"

# Compiler flags which are specifc to this device.
TARGETS_FOR_DEVICE := $(BUILD_TYPE_TARGET) TARGET_UVISOR_UNSUPPORTED TARGET_256K TARGET_CORTEX_M TARGET_EFM32 TARGET_EFM32PG TARGET_EFM32PG1B100F256GM32 TARGET_EFM32PG_STK3401 TARGET_LIKE_CORTEX_M4 TARGET_M4 TARGET_RTOS_M4_M7 TARGET_SL_CRYPTO TARGET_Silicon_Labs
FEATURES_FOR_DEVICE :=
PERIPHERALS_FOR_DEVICE := DEVICE_ANALOGIN DEVICE_ERROR_PATTERN DEVICE_I2C DEVICE_I2CSLAVE DEVICE_I2C_ASYNCH DEVICE_INTERRUPTIN DEVICE_LOWPOWERTIMER DEVICE_PORTIN DEVICE_PORTINOUT DEVICE_PORTOUT DEVICE_PWMOUT DEVICE_RTC DEVICE_SERIAL DEVICE_SERIAL_ASYNCH DEVICE_SLEEP DEVICE_SPI DEVICE_SPISLAVE DEVICE_SPI_ASYNCH DEVICE_STDIO_MESSAGES
GCC_DEFINES := $(patsubst %,-D%,$(TARGETS_FOR_DEVICE))
GCC_DEFINES += $(patsubst %,-D%=1,$(FEATURES_FOR_DEVICE))
GCC_DEFINES += $(patsubst %,-D%=1,$(PERIPHERALS_FOR_DEVICE))
GCC_DEFINES += -D__CORTEX_M4 -DARM_MATH_CM4 -D__FPU_PRESENT=1 -D__CMSIS_RTOS -D__MBED_CMSIS_RTOS_CM
GCC_DEFINES += -DEFM32PG1B100F256GM32 -DTRANSACTION_QUEUE_SIZE_SPI=4

# Value: HFXO for external crystal, HFRCO for internal RC oscillator
EFM32PG_STK3401_CORE_CLOCK_SOURCE ?= "HFXO"
GCC_DEFINES += -DCORE_CLOCK_SOURCE=$(EFM32PG_STK3401_CORE_CLOCK_SOURCE)

# Value: External crystal frequency in hertz
EFM32PG_STK3401_HFXO_FREQUENCY ?= "40000000"
GCC_DEFINES += -DHFXO_FREQUENCY=$(EFM32PG_STK3401_HFXO_FREQUENCY)

# Value: LFXO for external crystal, LFRCO for internal RC oscillator, ULFRCO for internal 1KHz RC oscillator
EFM32PG_STK3401_LOW_ENERGY_CLOCK_SOURCE ?= "LFXO"
GCC_DEFINES += -DLOW_ENERGY_CLOCK_SOURCE=$(EFM32PG_STK3401_LOW_ENERGY_CLOCK_SOURCE)

# Value: External crystal frequency in hertz
EFM32PG_STK3401_LFXO_FREQUENCY ?= "32768"
GCC_DEFINES += -DLFXO_FREQUENCY=$(EFM32PG_STK3401_LFXO_FREQUENCY)

# Value: Frequency in hertz, must correspond to setting of hfrco_band_select
EFM32PG_STK3401_HFRCO_FREQUENCY ?= "32000000"
GCC_DEFINES += -DHFRCO_FREQUENCY=$(EFM32PG_STK3401_HFRCO_FREQUENCY)

# Value: One of cmuHFRCOFreq_1M0Hz, cmuHFRCOFreq_2M0Hz, cmuHFRCOFreq_4M0Hz, cmuHFRCOFreq_7M0Hz, cmuHFRCOFreq_13M0Hz, cmuHFRCOFreq_16M0Hz, cmuHFRCOFreq_19M0Hz, cmuHFRCOFreq_26M0Hz, cmuHFRCOFreq_32M0Hz, cmuHFRCOFreq_38M0Hz. Be sure to set hfrco_clock_freq accordingly!
EFM32PG_STK3401_HFRCO_FREQUENCY_ENUM ?= "cmuHFRCOFreq_32M0Hz"
GCC_DEFINES += -DHFRCO_FREQUENCY_ENUM=$(EFM32PG_STK3401_HFRCO_FREQUENCY_ENUM)

# Pin to pull high for enabling the USB serial port
EFM32PG_STK3401_EFM_BC_EN ?= "PA5"
GCC_DEFINES += -DEFM_BC_EN=$(EFM32PG_STK3401_EFM_BC_EN)

C_FLAGS   := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
ASM_FLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
LD_FLAGS  := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp

# Extra platform specific object files to link into file binary.
DEVICE_OBJECTS := 

# Version of MRI library to use for this device.
DEVICE_MRI_LIB := 

# Determine all mbed source folders which are a match for this device so that it only needs to be done once.
DEVICE_MBED_DIRS := $(call filter_dirs,$(RAW_MBED_DIRS),$(TARGETS_FOR_DEVICE),$(FEATURES_FOR_DEVICE))

# Linker script to be used.  Indicates what should be placed where in memory.
EFM32PG_STK3401_LSCRIPT  ?= $(call find_target_linkscript,$(DEVICE_MBED_DIRS))
LSCRIPT := $(EFM32PG_STK3401_LSCRIPT)

include $(GCC4MBED_DIR)/build/device-common.mk

else
# Have an empty rule for this device since it isn't supported.
.PHONY: $(MBED_DEVICE)

ifeq "$(OS)" "Windows_NT"
$(MBED_DEVICE):
	@REM >nul
else
$(MBED_DEVICE):
	@#
endif
endif # ifeq "$(findstring $(MBED_DEVICE),$(DEVICES))"...