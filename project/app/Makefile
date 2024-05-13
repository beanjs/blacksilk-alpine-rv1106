
MAKEFILE_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
export LC_ALL=C
SHELL:=/bin/bash
MAKE=make
AT?=@

################################################################################
##   Platform Specified  Configuraton
################################################################################
include $(MAKEFILE_DIR)/Makefile.param

################################################################################
##   Public Configuraton
################################################################################

app_src := $(wildcard ./*/Makefile ./component/fastboot_server/Makefile)
app_src := $(dir $(app_src))

all: $(pkg-build)
ifeq ($(RK_ROOTFS_TYPE), ubuntu)
	@echo "RootFS type is Ubuntu. building lvgl_demo only."
	# make -C lvgl_app -j$(nproc) ||exit -1
else
	@echo "RootFS type is not Ubuntu. Proceeding with the build."
	$(foreach target,$(app_src),make -C $(target)||exit -1;)
endif
	$(call MAROC_COPY_PKG_TO_APP_OUTPUT, $(RK_PROJECT_PATH_APP), $(RK_APP_OUTPUT))

distclean: clean

clean:
	$(foreach target,$(app_src),make clean -C $(target)||exit -1;)
	@rm -rf $(RK_APP_OUTPUT)

info:
	@$(foreach target,$(app_src),make -C $(target) info||exit 0;)
