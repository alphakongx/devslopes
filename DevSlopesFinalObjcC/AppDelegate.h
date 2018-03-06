//
//  AppDelegate.h
//  DevSlopesFinalObjcC
//
//  Created by Scott Lydon on 3/3/18.
//  Copyright © 2018 Scott Lydon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

