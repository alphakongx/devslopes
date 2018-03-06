//
//  VideoVC.h
//  DevSlopesFinalObjcC
//
//  Created by Scott Lydon on 3/5/18.
//  Copyright © 2018 Scott Lydon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Webkit/Webkit.h>

@class Video;

@interface VideoVC : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) Video *video;

@end
