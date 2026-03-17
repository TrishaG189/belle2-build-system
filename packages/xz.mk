XZ_TAR := xz-$(XZ_VERSION).tar.gz
XZ_DIR := xz-$(XZ_VERSION)

xz: dirs
	@if [ ! -f $(DOWNLOADS)/$(XZ_TAR) ]; then \
		curl -L -o $(DOWNLOADS)/$(XZ_TAR) https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)/$(XZ_TAR); \
	fi
	@tar -xf $(DOWNLOADS)/$(XZ_TAR) -C $(BUILD)
	cd $(BUILD)/$(XZ_DIR) && \
		./configure --prefix=$(PREFIX) --disable-static --enable-shared && \
		$(MAKE) $(JOBS) && \
		$(MAKE) install