LIBFFI_TAR := libffi-$(LIBFFI_VERSION).tar.gz
LIBFFI_DIR := libffi-$(LIBFFI_VERSION)

libffi: dirs
	@if [ ! -f $(DOWNLOADS)/$(LIBFFI_TAR) ]; then \
		curl -L -o $(DOWNLOADS)/$(LIBFFI_TAR) https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)/$(LIBFFI_TAR); \
	fi
	@tar -xf $(DOWNLOADS)/$(LIBFFI_TAR) -C $(BUILD)
	cd $(BUILD)/$(LIBFFI_DIR) && \
		./configure --prefix=$(PREFIX) --disable-static --enable-shared && \
		$(MAKE) $(JOBS) && \
		$(MAKE) install