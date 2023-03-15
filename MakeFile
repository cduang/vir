MODULE_NAME := virt2phys
RESMAN_CORE_OBJS:=virt2phys.o
RESMAN_GLUE_OBJS:=
ifneq ($(KERNELRELEASE),)
obj-m :=virt2phys.o
else
KDIR :=/lib/modules/$(shell uname -r)/build
PWD        := $(shell pwd)
all:
    make -C $(KDIR) M=$(PWD) modules
clean:
    rm -f *.ko *.o *.mod.o *.mod.c *.symvers *.order
endif
