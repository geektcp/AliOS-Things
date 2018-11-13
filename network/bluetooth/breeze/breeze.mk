
NAME := breeze

$(NAME)_MBINS_TYPE := kernel
$(NAME)_VERSION := 0.0.1
$(NAME)_SUMMARY :=

$(NAME)_SOURCES += core/core.c
$(NAME)_SOURCES += core/transport.c
$(NAME)_SOURCES += core/ble_service.c
$(NAME)_SOURCES += core/sha256.c
$(NAME)_SOURCES += core/utils.c

GLOBAL_INCLUDES += api include hal/include

$(NAME)_COMPONENTS := chip_code

secure_adv ?= 1
ifeq ($(secure_adv), 1)
GLOBAL_DEFINES += CONFIG_AIS_SECURE_ADV
endif

btstack ?= zephyr
ifeq (zephyr, $(btstack))
$(NAME)_COMPONENTS += bluetooth.breeze.hal.ble
endif

$(NAME)_SOURCES += api/breeze_export.c

bz_en_awss ?= 1
ifeq ($(bz_en_awss), 1)
GLOBAL_DEFINES += EN_COMBO_NET
$(NAME)_SOURCES += core/extcmd.c
$(NAME)_SOURCES += api/breeze_awss_export.c
endif

bz_en_auth ?= 1
ifeq ($(bz_en_auth), 1)
GLOBAL_DEFINES += EN_AUTH
$(NAME)_SOURCES += core/auth.c
endif
