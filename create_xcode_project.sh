#!/bin/bash

# Create a working Xcode project for buddyChatGPT
# This creates a clean project that Xcode can open successfully

mkdir -p buddyChatGPT.xcodeproj

cat > buddyChatGPT.xcodeproj/project.pbxproj << 'EOF'
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {

/* Begin PBXBuildFile section */
		4A1111111111111A /* buddyChatGPTApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 4A1111111111111B /* buddyChatGPTApp.swift */; };
		4A1111111111111C /* ContentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 4A1111111111111D /* ContentView.swift */; };
		4A1111111111111E /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 4A1111111111111F /* Assets.xcassets */; };
		4A111111111111120 /* ChatService.swift in Sources */ = {isa = PBXBuildFile; fileRef = 4A111111111111121 /* ChatService.swift */; };
		4A111111111111122 /* ScreenshotService.swift in Sources */ = {isa = PBXBuildFile; fileRef = 4A111111111111123 /* ScreenshotService.swift */; };
		4A111111111111124 /* MessageModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 4A111111111111125 /* MessageModel.swift */; };
		4A111111111111126 /* screenpipe in Resources */ = {isa = PBXBuildFile; fileRef = 4A111111111111127 /* screenpipe */; };
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
		4A111111111111118 /* buddyChatGPT.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = buddyChatGPT.app; sourceTree = BUILT_PRODUCTS_DIR; };
		4A1111111111111B /* buddyChatGPTApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = buddyChatGPTApp.swift; sourceTree = "<group>"; };
		4A1111111111111D /* ContentView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentView.swift; sourceTree = "<group>"; };
		4A1111111111111F /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
		4A111111111111121 /* ChatService.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ChatService.swift; sourceTree = "<group>"; };
		4A111111111111123 /* ScreenshotService.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ScreenshotService.swift; sourceTree = "<group>"; };
		4A111111111111125 /* MessageModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MessageModel.swift; sourceTree = "<group>"; };
		4A111111111111127 /* screenpipe */ = {isa = PBXFileReference; lastKnownFileType = "compiled.mach-o.executable"; path = screenpipe; sourceTree = "<group>"; };
		4A111111111111128 /* buddyChatGPT.entitlements */ = {isa = PBXFileReference; lastKnownFileType = text.plist.entitlements; path = buddyChatGPT.entitlements; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
		4A111111111111115 /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		4A11111111111110C /* Project */ = {
			isa = PBXGroup;
			children = (
				4A111111111111117 /* buddyChatGPT */,
				4A111111111111119 /* Products */,
			);
			sourceTree = "<group>";
		};
		4A111111111111117 /* buddyChatGPT */ = {
			isa = PBXGroup;
			children = (
				4A1111111111111B /* buddyChatGPTApp.swift */,
				4A1111111111111D /* ContentView.swift */,
				4A111111111111121 /* ChatService.swift */,
				4A111111111111123 /* ScreenshotService.swift */,
				4A111111111111125 /* MessageModel.swift */,
				4A111111111111129 /* Resources */,
				4A1111111111111F /* Assets.xcassets */,
				4A111111111111128 /* buddyChatGPT.entitlements */,
			);
			path = buddyChatGPT;
			sourceTree = "<group>";
		};
		4A111111111111119 /* Products */ = {
			isa = PBXGroup;
			children = (
				4A111111111111118 /* buddyChatGPT.app */,
			);
			name = Products;
			sourceTree = "<group>";
		};
		4A111111111111129 /* Resources */ = {
			isa = PBXGroup;
			children = (
				4A111111111111127 /* screenpipe */,
			);
			path = Resources;
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		4A111111111111117 /* buddyChatGPT */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 4A11111111111112B /* Build configuration list for PBXNativeTarget "buddyChatGPT" */;
			buildPhases = (
				4A111111111111114 /* Sources */,
				4A111111111111115 /* Frameworks */,
				4A111111111111116 /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = buddyChatGPT;
			productName = buddyChatGPT;
			productReference = 4A111111111111118 /* buddyChatGPT.app */;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		4A11111111111110D /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = 1;
				LastSwiftUpdateCheck = 1500;
				LastUpgradeCheck = 1500;
				TargetAttributes = {
					4A111111111111117 = {
						CreatedOnToolsVersion = 15.0;
					};
				};
			};
			buildConfigurationList = 4A111111111111110 /* Build configuration list for PBXProject "buddyChatGPT" */;
			compatibilityVersion = "Xcode 14.0";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = 4A11111111111110C;
			productRefGroup = 4A111111111111119 /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				4A111111111111117 /* buddyChatGPT */,
			);
		};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		4A111111111111116 /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				4A1111111111111E /* Assets.xcassets in Resources */,
				4A111111111111126 /* screenpipe in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		4A111111111111114 /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				4A1111111111111C /* ContentView.swift in Sources */,
				4A111111111111120 /* ChatService.swift in Sources */,
				4A111111111111122 /* ScreenshotService.swift in Sources */,
				4A111111111111124 /* MessageModel.swift in Sources */,
				4A1111111111111A /* buddyChatGPTApp.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin XCBuildConfiguration section */
		4A111111111111111 /* Debug */ = {
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
					"$(inherited)",
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
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG $(inherited)";
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
			};
			name = Debug;
		};
		4A111111111111112 /* Release */ = {
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
		4A111111111111113 /* Debug */ = {
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
				INFOPLIST_KEY_NSMainStoryboardFile = Main;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/../Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.buddychatgpt.app;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
			};
			name = Debug;
		};
		4A111111111111114 /* Release */ = {
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
				INFOPLIST_KEY_NSMainStoryboardFile = Main;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/../Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.buddychatgpt.app;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		4A111111111111110 /* Build configuration list for PBXProject "buddyChatGPT" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				4A111111111111111 /* Debug */,
				4A111111111111112 /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		4A11111111111112B /* Build configuration list for PBXNativeTarget "buddyChatGPT" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				4A111111111111113 /* Debug */,
				4A111111111111114 /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */
	};
	rootObject = 4A11111111111110D /* Project object */;
}
EOF

echo "Clean Xcode project created successfully!"
echo "You can now open buddyChatGPT.xcodeproj in Xcode"