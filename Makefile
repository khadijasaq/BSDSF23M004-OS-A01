# Root Makefile

SUBDIRS = src

.PHONY: all clean

all: $(SUBDIRS)
	@echo "Build complete. Executable is in bin/"

$(SUBDIRS):
	$(MAKE) -C $@

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
