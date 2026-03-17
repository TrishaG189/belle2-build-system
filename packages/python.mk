PYTHON_TAR := Python-$(PYTHON_VERSION).tgz
PYTHON_DIR := Python-$(PYTHON_VERSION)

# Python explicitly depends on the other three

python: libffi xz sqlite
	@if [ ! -f $(DOWNLOADS)/$(PYTHON_TAR) ]; then \
		curl -L -o $(DOWNLOADS)/$(PYTHON_TAR) https://www.python.org/ftp/python/$(PYTHON_VERSION)/$(PYTHON_TAR); \
	fi
	@tar -xf $(DOWNLOADS)/$(PYTHON_TAR) -C $(BUILD)
	cd $(BUILD)/$(PYTHON_DIR) && \
		env PKG_CONFIG_PATH=$(CUSTOM_PKG_CONF) \
		CPPFLAGS="$(CUSTOM_CPPFLAGS)" \
		LDFLAGS="$(CUSTOM_LDFLAGS)" \
		./configure --prefix=$(PREFIX) \
			--enable-optimizations \
			--enable-shared \
			--with-ensurepip=upgrade && \
		$(MAKE) $(JOBS) && \
		$(MAKE) install