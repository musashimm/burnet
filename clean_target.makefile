
clean-target:
	rm -rf $(TARGET_DIR) $(STAGING_DIR) $(STAMP_DIR) $(BUILD_DIR)/.root \
$(BUILD_DIR)/*/.stamp_target_installed $(BUILD_DIR)/*/.stamp_staging_installed \
$(BUILD_DIR)/linux-*/.stamp_installed $(BUILD_DIR)/*/.built
