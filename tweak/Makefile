DEBUG = 0
GO_EASY_ON_ME = 1
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.0
ARCHS = armv7 arm64 armv7s

include theos/makefiles/common.mk

TWEAK_NAME = WatchTweak
WatchTweak_FILES = Tweak.xm
WatchTweak_PRIVATE_FRAMEWORKS = AppSupport
WatchTweak_LIBRARIES = rocketbootstrap

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += watchtweakspringboardcomponent
include $(THEOS_MAKE_PATH)/aggregate.mk
