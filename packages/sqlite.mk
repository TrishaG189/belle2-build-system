SQLITE_TAR := sqlite-autoconf-$(SQLITE_VERSION).tar.gz
SQLITE_DIR := sqlite-autoconf-$(SQLITE_VERSION)

sqlite: dirs
	@if [ ! -f $(DOWNLOADS)/$(SQLITE_TAR) ]; then \
		curl -L -o $(DOWNLOADS)/$(SQLITE_TAR) https://sqlite.org/2024/$(SQLITE_TAR); \
	fi
	@tar -xf $(DOWNLOADS)/$(SQLITE_TAR) -C $(BUILD)
	cd $(BUILD)/$(SQLITE_DIR) && \
		./configure --prefix=$(PREFIX) --disable-static --enable-shared && \
		$(MAKE) $(JOBS) && \
		$(MAKE) install