//
//  HTTPService.m
//  DevSlopesFinalObjcC
//
//  Created by Scott Lydon on 3/3/18.
//  Copyright © 2018 Scott Lydon. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6070"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService

+ (id) instance {
    static HTTPService *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

- (void) getTutorials: (nullable onComplete)completionHandler {
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is corrupt.  Please try again.");
            }
        } else {
            NSLog(@"NEtwork ERR: %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to the server -SL");
        }
    }] resume];
}
@end
