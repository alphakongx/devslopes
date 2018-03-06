

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImg;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UIView *cellView;

@end



@implementation VideoCell

-(void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 0.5;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
}

-(void)updateUI: (nonnull Video*)video {
    self.titleLabel.text = video.title;
    self.descLbl.text = video.desc;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnail]]];
    self.thumbImg.image = image;
    
}

@end
