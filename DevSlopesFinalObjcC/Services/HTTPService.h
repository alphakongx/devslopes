//
//  HTTPService.h
//  DevSlopesFinalObjcC
//
//  Created by Scott Lydon on 3/3/18.
//  Copyright © 2018 Scott Lydon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+ (id _Nonnull ) instance;
- (void) getTutorials: (nullable onComplete)completionHandler;

@end
