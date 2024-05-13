
ifeq ($(MEDIA_PARAM), )
    MEDIA_PARAM:=../Makefile.param
    include $(MEDIA_PARAM)
endif

ifneq ($(findstring $(RK_ENABLE_SAMPLE),n y),)
CONFIG_RK_SAMPLE=$(RK_ENABLE_SAMPLE)
else
CONFIG_RK_SAMPLE=y
endif

CURRENT_DIR := $(shell pwd)

ifeq ($(rk_static),1)
export BUILD_STATIC_LINK=y
else
export BUILD_STATIC_LINK=n
endif

ifeq ($(RK_MEDIA_SAMPLE_STATIC_LINK),y)
export BUILD_STATIC_LINK=y
else
export BUILD_STATIC_LINK=n
endif

PKG_NAME := sample
PKG_BUILD ?= build

ifeq ($(CONFIG_RK_SAMPLE),y)
PKG_TARGET := example-build
PKG_TARGET += simple_test-build
else
PKG_TARGET :=
$(warning Not config source RK_SAMPLE, Skip...)
endif

all: $(PKG_TARGET)
	@echo "build $(PKG_NAME) done";

example-build:
	@make -C $(CURRENT_DIR)/example/ -j$(RK_MEDIA_JOBS)

simple_test-build:
	@make -C $(CURRENT_DIR)/simple_test/ -j$(RK_MEDIA_JOBS)

clean:
	@make -C $(CURRENT_DIR)/example/ clean
	@make -C $(CURRENT_DIR)/simple_test/ clean

help:
	@echo "help message:"
	@echo "     build with dynamic link:  make "
	@echo "     build with static  link:  make rk_static=1"

distclean: clean
