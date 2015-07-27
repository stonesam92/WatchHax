//
//  ControlInterfaceController.m
//  WatchLauncher
//
//  Created by Sam Stone on 19/07/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import "ControlInterfaceController.h"

@interface ControlInterfaceController ()

@end

@implementation ControlInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSLog(@"this is %@", [NSBundle mainBundle].bundleIdentifier);
    
    // Configure interface objects here.
}

- (IBAction)didTouchVolumeUp {
    NSLog(@"ERROR: This method should be overridden");
}

- (IBAction)didTouchVolumeDown {
    NSLog(@"ERROR: This method should be overridden");
}

- (IBAction)didTouchHome {
    NSLog(@"ERROR: This method should be overridden");
}

- (IBAction)didTouchLock {
    NSLog(@"ERROR: This method should be overridden");
}

- (IBAction)didTouchRespring {
    NSLog(@"ERROR: This method should be overridden");
}
@end



