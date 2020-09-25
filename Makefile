XBE_TITLE = rsbsPLUS-xbox
GEN_XISO = $(XBE_TITLE).iso
SRCS = $(CURDIR)/main.c
NXDK_DIR = /opt/nxdk
NXDK_SDL = y
include $(NXDK_DIR)/Makefile

TARGET += $(OUTPUT_DIR)/res
$(GEN_XISO): $(OUTPUT_DIR)/res
$(OUTPUT_DIR)/res: $(CURDIR)/res $(OUTPUT_DIR)
	rm -rf $(OUTPUT_DIR)/res
	$(VE)cp -rf '$<' '$@'

.PHONY: clean 
clean: $(CLEANRULES)
	$(VE)rm -rf $(TARGET) \
	           main.exe main.exe.manifest main.lib \
	           $(OBJS) $(SHADER_OBJS) $(DEPS) \
	           $(GEN_XISO)
