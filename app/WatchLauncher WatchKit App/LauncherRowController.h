//
//  LauncherRow.h
//  WatchLauncher
//
//  Created by Sam Stone on 17/07/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface LauncherRowController : NSObject
@property (strong, nonatomic) NSString *appDisplayName;
@property (strong, nonatomic) NSString *appBundleID;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *selectionButton;
@end
