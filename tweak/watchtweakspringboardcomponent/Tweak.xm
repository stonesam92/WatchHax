#include <stdio.h>
#include <CoreFoundation/CoreFoundation.h>

#import "substrate.h"
#import "rocketbootstrap.h"
#import "CPDistributedMessagingCenter.h"

CPDistributedMessagingCenter *messageCenter;

#ifndef SPRINGBOARDSERVICES_H_
extern int SBSLaunchApplicationWithIdentifier(CFStringRef identifier, Boolean suspended);
extern CFStringRef SBSApplicationLaunchingErrorString(int error);
#endif

@interface SpringBoard
+ (SpringBoard *)sharedApplication;
- (void)_menuButtonDown:(id)arg1;
- (void)_menuButtonUp:(id)arg1;
- (void)_caseLatchWantsToAttemptLock;
@end

@interface VolumeControl
+ (VolumeControl *)sharedVolumeControl;
- (void)decreaseVolume;
- (void)increaseVolume;
- (void)cancelVolumeEvent;
@end


%hook SBUIController

+ (SBUIController *)sharedInstance {
    SBUIController *sharedInstance = %orig;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        messageCenter = [CPDistributedMessagingCenter centerNamed:@"com.samstone.watchtweak"];
        rocketbootstrap_distributedmessagingcenter_apply(messageCenter);
        [messageCenter runServerOnCurrentThread];
        [messageCenter registerForMessageName:@"homeButton" 
                                       target:sharedInstance
                                     selector:@selector(homeButton)];
        [messageCenter registerForMessageName:@"volumeUp" 
                                       target:sharedInstance
                                     selector:@selector(volumeUp)];
        [messageCenter registerForMessageName:@"volumeDown" 
                                       target:sharedInstance
                                     selector:@selector(volumeDown)];
        [messageCenter registerForMessageName:@"lockButton" 
                                       target:sharedInstance
                                     selector:@selector(lockDevice)];
        [messageCenter registerForMessageName:@"respring" 
                                       target:sharedInstance
                                     selector:@selector(respring)];
        [messageCenter registerForMessageName:@"openApp" 
                                       target:sharedInstance
                                     selector:@selector(openAppMessage:userInfo:)];
        });
    return sharedInstance;
}

%new
- (void)homeButton {
    [[%c(SpringBoard) sharedApplication] _menuButtonDown:nil];
    [[%c(SpringBoard) sharedApplication] _menuButtonUp:nil];
}

%new
- (void)volumeDown {
    VolumeControl *vc = [%c(VolumeControl) sharedVolumeControl];
    [vc decreaseVolume];
    [vc cancelVolumeEvent];
}

%new
- (void)volumeUp {
    VolumeControl *vc = [%c(VolumeControl) sharedVolumeControl];
    [vc increaseVolume];
    [vc cancelVolumeEvent];
}

%new
- (void)lockDevice {
    [[%c(SpringBoard) sharedApplication ] _caseLatchWantsToAttemptLock];
}

%new 
- (void)respring {
    system("killall -HUP SpringBoard");
}

%new
- (void)openAppMessage:(NSString *)message userInfo:(NSDictionary *)userInfo {
    CFStringRef appID = (CFStringRef) userInfo[@"identifier"];
    SBSLaunchApplicationWithIdentifier(appID, FALSE);
}

%end

