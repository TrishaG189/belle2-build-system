# config.mk - Central Configuration

PREFIX := $(PWD)/install
BUILD := $(PWD)/build
DOWNLOADS := $(PWD)/downloads

# Using all the available CPU cores for faster compilation 
JOBS := -j$(shell nproc 2>/dev/null || echo 4)

# Package Versions for Reproducibility
LIBFFI_VERSION := 3.4.5
XZ_VERSION     := 5.4.6
SQLITE_VERSION := 3450200
PYTHON_VERSION := 3.11.8

# Global Compiler Flags - for Prefix Isolation
# -Wl,-rpath inserts the library paths permanently into the binaries
CUSTOM_CPPFLAGS := -I$(PREFIX)/include
CUSTOM_LDFLAGS  := -L$(PREFIX)/lib -L$(PREFIX)/lib64 -Wl,-rpath=$(PREFIX)/lib -Wl,-rpath=$(PREFIX)/lib64
CUSTOM_PKG_CONF := $(PREFIX)/lib/pkgconfig:$(PREFIX)/lib64/pkgconfig