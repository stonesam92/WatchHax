#import "substrate.h"
#import "rocketbootstrap.h"
#import "CPDistributedMessagingCenter.h"

CPDistributedMessagingCenter *messageCenter;

%hook ControlInterfaceController

- (void)didTouchVolumeUp {
    [messageCenter sendMessageName:@"volumeUp" userInfo:nil];
}

- (void)didTouchVolumeDown {
    [messageCenter sendMessageName:@"volumeDown" userInfo:nil];
}

- (void)didTouchHome {
    [messageCenter sendMessageName:@"homeButton" userInfo:nil];
}

- (void)didTouchLock {
    [messageCenter sendMessageName:@"lockButton" userInfo:nil];
}

- (void)didTouchRespring {
    [messageCenter sendMessageName:@"respring" userInfo:nil];
}

%end

%ctor {
    messageCenter = [CPDistributedMessagingCenter centerNamed:@"com.samstone.watchtweak"];
    rocketbootstrap_distributedmessagingcenter_apply(messageCenter);
}
