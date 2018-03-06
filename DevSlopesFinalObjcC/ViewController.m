#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (NSDictionary *d in dataArray) {
                Video *vid = [Video new];
                vid.title = [d objectForKey:@"title"];
                vid.desc = [d objectForKey:@"description"];
                vid.thumbnail = [d objectForKey:@"thumbnail"];
                vid.iframe = [d objectForKey:@"iframe"];
                [arr addObject:vid];
            }
            self.videoList = arr;
            [self updateTableData];
            
        } else if (errMessage) {
            //Display alert to user
        }
    }];
}


-(void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableview reloadData];
    });
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"main"];
    if (!cell) {
        cell = [[VideoCell alloc]init];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *vidCell = (VideoCell*)cell;
    [vidCell updateUI:video];
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

@end
