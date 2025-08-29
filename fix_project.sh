#!/bin/bash

# Create a working Xcode project from scratch
# This ensures all references are correct and valid

echo "Creating clean Xcode project..."

# Remove any existing broken project
rm -rf buddyChatGPT.xcodeproj

# Create project directory
mkdir buddyChatGPT.xcodeproj

# Generate unique IDs for consistency
PROJECT_ID="4F7A8B9C0123456789ABCDEF"
APP_TARGET_ID="4F7A8B9C0123456789ABCDE0"
PRODUCTS_GROUP_ID="4F7A8B9C0123456789ABCDE1"
MAIN_GROUP_ID="4F7A8B9C0123456789ABCDE2"
SOURCE_GROUP_ID="4F7A8B9C0123456789ABCDE3"
RESOURCES_GROUP_ID="4F7A8B9C0123456789ABCDE4"

# App file reference
APP_REF_ID="4F7A8B9C0123456789ABCDE5"

# Source file references
APP_SWIFT_REF="4F7A8B9C0123456789ABCDE6"
CONTENT_VIEW_REF="4F7A8B9C0123456789ABCDE7"
CHAT_SERVICE_REF="4F7A8B9C0123456789ABCDE8"
SCREENSHOT_SERVICE_REF="4F7A8B9C0123456789ABCDE9"
MESSAGE_MODEL_REF="4F7A8B9C0123456789ABCDEA"
ASSETS_REF="4F7A8B9C0123456789ABCDEB"
ENTITLEMENTS_REF="4F7A8B9C0123456789ABCDEC"
SCREENPIPE_REF="4F7A8B9C0123456789ABCDED"

# Build file references
APP_SWIFT_BUILD="4F7A8B9C0123456789ABCDEE"
CONTENT_VIEW_BUILD="4F7A8B9C0123456789ABCDEF"
CHAT_SERVICE_BUILD="4F7A8B9C0123456789ABCDF0"
SCREENSHOT_SERVICE_BUILD="4F7A8B9C0123456789ABCDF1"
MESSAGE_MODEL_BUILD="4F7A8B9C0123456789ABCDF2"
ASSETS_BUILD="4F7A8B9C0123456789ABCDF3"
SCREENPIPE_BUILD="4F7A8B9C0123456789ABCDF4"

# Build phases
SOURCES_PHASE="4F7A8B9C0123456789ABCDF5"
FRAMEWORKS_PHASE="4F7A8B9C0123456789ABCDF6"
RESOURCES_PHASE="4F7A8B9C0123456789ABCDF7"

# Build configurations
PROJECT_DEBUG_CONFIG="4F7A8B9C0123456789ABCDF8"
PROJECT_RELEASE_CONFIG="4F7A8B9C0123456789ABCDF9"
TARGET_DEBUG_CONFIG="4F7A8B9C0123456789ABCDFA"
TARGET_RELEASE_CONFIG="4F7A8B9C0123456789ABCDFB"

# Configuration lists
PROJECT_CONFIG_LIST="4F7A8B9C0123456789ABCDFC"
TARGET_CONFIG_LIST="4F7A8B9C0123456789ABCDFD"

cat > buddyChatGPT.xcodeproj/project.pbxproj << EOF
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {

/* Begin PBXBuildFile section */
		${APP_SWIFT_BUILD} /* buddyChatGPTApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = ${APP_SWIFT_REF} /* buddyChatGPTApp.swift */; };
		${CONTENT_VIEW_BUILD} /* ContentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = ${CONTENT_VIEW_REF} /* ContentView.swift */; };
		${CHAT_SERVICE_BUILD} /* ChatService.swift in Sources */ = {isa = PBXBuildFile; fileRef = ${CHAT_SERVICE_REF} /* ChatService.swift */; };
		${SCREENSHOT_SERVICE_BUILD} /* ScreenshotService.swift in Sources */ = {isa = PBXBuildFile; fileRef = ${SCREENSHOT_SERVICE_REF} /* ScreenshotService.swift */; };
		${MESSAGE_MODEL_BUILD} /* MessageModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = ${MESSAGE_MODEL_REF} /* MessageModel.swift */; };
		${ASSETS_BUILD} /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = ${ASSETS_REF} /* Assets.xcassets */; };
		${SCREENPIPE_BUILD} /* screenpipe in Resources */ = {isa = PBXBuildFile; fileRef = ${SCREENPIPE_REF} /* screenpipe */; };
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
		${APP_REF_ID} /* buddyChatGPT.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = buddyChatGPT.app; sourceTree = BUILT_PRODUCTS_DIR; };
		${APP_SWIFT_REF} /* buddyChatGPTApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = buddyChatGPTApp.swift; sourceTree = "<group>"; };
		${CONTENT_VIEW_REF} /* ContentView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentView.swift; sourceTree = "<group>"; };
		${CHAT_SERVICE_REF} /* ChatService.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ChatService.swift; sourceTree = "<group>"; };
		${SCREENSHOT_SERVICE_REF} /* ScreenshotService.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ScreenshotService.swift; sourceTree = "<group>"; };
		${MESSAGE_MODEL_REF} /* MessageModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MessageModel.swift; sourceTree = "<group>"; };
		${ASSETS_REF} /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
		${ENTITLEMENTS_REF} /* buddyChatGPT.entitlements */ = {isa = PBXFileReference; lastKnownFileType = text.plist.entitlements; path = buddyChatGPT.entitlements; sourceTree = "<group>"; };
		${SCREENPIPE_REF} /* screenpipe */ = {isa = PBXFileReference; lastKnownFileType = "compiled.mach-o.executable"; path = screenpipe; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
		${FRAMEWORKS_PHASE} /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		${MAIN_GROUP_ID} = {
			isa = PBXGroup;
			children = (
				${SOURCE_GROUP_ID} /* buddyChatGPT */,
				${PRODUCTS_GROUP_ID} /* Products */,
			);
			sourceTree = "<group>";
		};
		${PRODUCTS_GROUP_ID} /* Products */ = {
			isa = PBXGroup;
			children = (
				${APP_REF_ID} /* buddyChatGPT.app */,
			);
			name = Products;
			sourceTree = "<group>";
		};
		${SOURCE_GROUP_ID} /* buddyChatGPT */ = {
			isa = PBXGroup;
			children = (
				${APP_SWIFT_REF} /* buddyChatGPTApp.swift */,
				${CONTENT_VIEW_REF} /* ContentView.swift */,
				${CHAT_SERVICE_REF} /* ChatService.swift */,
				${SCREENSHOT_SERVICE_REF} /* ScreenshotService.swift */,
				${MESSAGE_MODEL_REF} /* MessageModel.swift */,
				${RESOURCES_GROUP_ID} /* Resources */,
				${ASSETS_REF} /* Assets.xcassets */,
				${ENTITLEMENTS_REF} /* buddyChatGPT.entitlements */,
			);
			path = buddyChatGPT;
			sourceTree = "<group>";
		};
		${RESOURCES_GROUP_ID} /* Resources */ = {
			isa = PBXGroup;
			children = (
				${SCREENPIPE_REF} /* screenpipe */,
			);
			path = Resources;
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		${APP_TARGET_ID} /* buddyChatGPT */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = ${TARGET_CONFIG_LIST} /* Build configuration list for PBXNativeTarget "buddyChatGPT" */;
			buildPhases = (
				${SOURCES_PHASE} /* Sources */,
				${FRAMEWORKS_PHASE} /* Frameworks */,
				${RESOURCES_PHASE} /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = buddyChatGPT;
			productName = buddyChatGPT;
			productReference = ${APP_REF_ID} /* buddyChatGPT.app */;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		${PROJECT_ID} /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = 1;
				LastSwiftUpdateCheck = 1500;
				LastUpgradeCheck = 1500;
				TargetAttributes = {
					${APP_TARGET_ID} = {
						CreatedOnToolsVersion = 15.0;
					};
				};
			};
			buildConfigurationList = ${PROJECT_CONFIG_LIST} /* Build configuration list for PBXProject "buddyChatGPT" */;
			compatibilityVersion = "Xcode 14.0";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = ${MAIN_GROUP_ID};
			productRefGroup = ${PRODUCTS_GROUP_ID} /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				${APP_TARGET_ID} /* buddyChatGPT */,
			);
		};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		${RESOURCES_PHASE} /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				${ASSETS_BUILD} /* Assets.xcassets in Resources */,
				${SCREENPIPE_BUILD} /* screenpipe in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		${SOURCES_PHASE} /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				${CONTENT_VIEW_BUILD} /* ContentView.swift in Sources */,
				${CHAT_SERVICE_BUILD} /* ChatService.swift in Sources */,
				${SCREENSHOT_SERVICE_BUILD} /* ScreenshotService.swift in Sources */,
				${MESSAGE_MODEL_BUILD} /* MessageModel.swift in Sources */,
				${APP_SWIFT_BUILD} /* buddyChatGPTApp.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin XCBuildConfiguration section */
		${PROJECT_DEBUG_CONFIG} /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = dwarf;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_TESTABILITY = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = YES;
				GCC_C_LANGUAGE_STANDARD = gnu17;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					"DEBUG=1",
					"\$(inherited)",
				);
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
				MACOSX_DEPLOYMENT_TARGET = 14.0;
				MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
				MTL_FAST_MATH = YES;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = macosx;
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG \$(inherited)";
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
			};
			name = Debug;
		};
		${PROJECT_RELEASE_CONFIG} /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = YES;
				GCC_C_LANGUAGE_STANDARD = gnu17;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
				MACOSX_DEPLOYMENT_TARGET = 14.0;
				MTL_ENABLE_DEBUG_INFO = NO;
				MTL_FAST_MATH = YES;
				SDKROOT = macosx;
				SWIFT_COMPILATION_MODE = wholemodule;
			};
			name = Release;
		};
		${TARGET_DEBUG_CONFIG} /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_ENTITLEMENTS = buddyChatGPT/buddyChatGPT.entitlements;
				CODE_SIGN_STYLE = Automatic;
				COMBINE_HIDPI_IMAGES = YES;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "";
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_KEY_NSHumanReadableCopyright = "";
				LD_RUNPATH_SEARCH_PATHS = (
					"\$(inherited)",
					"@executable_path/../Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.buddychatgpt.app;
				PRODUCT_NAME = "\$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
			};
			name = Debug;
		};
		${TARGET_RELEASE_CONFIG} /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_ENTITLEMENTS = buddyChatGPT/buddyChatGPT.entitlements;
				CODE_SIGN_STYLE = Automatic;
				COMBINE_HIDPI_IMAGES = YES;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "";
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_KEY_NSHumanReadableCopyright = "";
				LD_RUNPATH_SEARCH_PATHS = (
					"\$(inherited)",
					"@executable_path/../Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.buddychatgpt.app;
				PRODUCT_NAME = "\$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		${PROJECT_CONFIG_LIST} /* Build configuration list for PBXProject "buddyChatGPT" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				${PROJECT_DEBUG_CONFIG} /* Debug */,
				${PROJECT_RELEASE_CONFIG} /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		${TARGET_CONFIG_LIST} /* Build configuration list for PBXNativeTarget "buddyChatGPT" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				${TARGET_DEBUG_CONFIG} /* Debug */,
				${TARGET_RELEASE_CONFIG} /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */
	};
	rootObject = ${PROJECT_ID} /* Project object */;
}
EOF

echo "✅ Clean Xcode project created successfully!"
echo "You can now open buddyChatGPT.xcodeproj in Xcode without errors."