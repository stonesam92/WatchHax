//
//  LauncherRow.m
//  WatchLauncher
//
//  Created by Sam Stone on 17/07/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import "LauncherRowController.h"

@implementation LauncherRowController
- (IBAction)pressButton:(id)sender {
    char command[100];
    sprintf(command, "open %s", self.appBundleID.UTF8String);
    system(command);
    NSLog(@"finished launching");
}

- (void)setAppDisplayName:(NSString *)appDisplayName {
    _appDisplayName = appDisplayName;
    [self.selectionButton setTitle:appDisplayName];
}
@end
