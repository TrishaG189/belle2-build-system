# Makefile - Main Orchestration Layer

include config.mk

.PHONY: all clean dirs

all: dirs libffi xz sqlite python
	
	@echo "Build complete! Run 'source env.sh' now."

dirs:
	mkdir -p $(BUILD) $(DOWNLOADS) $(PREFIX)

# Individual package build instructions
include packages/libffi.mk
include packages/xz.mk
include packages/sqlite.mk
include packages/python.mk

clean:
	rm -rf $(BUILD) $(PREFIX) $(DOWNLOADS)