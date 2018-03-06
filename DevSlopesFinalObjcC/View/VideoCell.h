

#import <UIKit/UIKit.h>

//grants access to header only, less than import, saves space.
@class Video;

@interface VideoCell : UITableViewCell
-(void)updateUI: (nonnull Video*)video;
@end
