//
//  InterfaceController.h
//  WatchLauncher WatchKit Extension
//
//  Created by Sam Stone on 17/07/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface LauncherInterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@end
