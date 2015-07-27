GO_EASY_ON_ME = 1
TARGET := iphone:clang:latest:5.0
ARCHS = armv7 arm64 armv7s

include theos/makefiles/common.mk

TWEAK_NAME = WatchTweakSpringBoardComponent
WatchTweakSpringBoardComponent_FILES = Tweak.xm
WatchTweakSpringBoardComponent_PRIVATE_FRAMEWORKS := SpringBoardServices AppSupport 
WatchTweakSpringBoardComponent_LIBRARIES = rocketbootstrap

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
