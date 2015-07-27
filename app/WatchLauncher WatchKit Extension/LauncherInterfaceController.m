//
//  InterfaceController.m
//  WatchLauncher WatchKit Extension
//
//  Created by Sam Stone on 17/07/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import "LauncherInterfaceController.h"
#import "LauncherRowController.h"


@interface LauncherInterfaceController()
@property (strong, nonatomic) NSDictionary *launchableApps;
@property (strong, nonatomic) NSArray *appDisplayNames;
@end


@implementation LauncherInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    NSString *pathToAppPlist = [[NSBundle mainBundle] pathForResource:@"SupportedApps" ofType:@"plist"];
    _launchableApps = [NSDictionary dictionaryWithContentsOfFile:pathToAppPlist];
    _appDisplayNames = [[_launchableApps allKeys]
                        sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self setupTable];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (void)setupTable {
    [self.table setNumberOfRows:self.appDisplayNames.count withRowType:@"launcherRow"];
    
    for (int i = 0; i < self.table.numberOfRows; i++) {
        LauncherRowController *rowController = (LauncherRowController *)[self.table rowControllerAtIndex:i];
        NSString *appDisplayName = self.appDisplayNames[i];
        rowController.appDisplayName = appDisplayName;
        rowController.appBundleID = self.launchableApps[appDisplayName];
    }
}

@end



