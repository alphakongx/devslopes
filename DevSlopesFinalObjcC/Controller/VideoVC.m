
#import "VideoVC.h"
#import "Video.h"

@interface VideoVC ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation VideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    self.titleLabel.text = self.video.title;
    self.descriptionLabel.text = self.video.desc;
    [self.webView loadHTMLString:self.video.iframe baseURL:nil];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString *css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video { position: absolute; top: 0; left: 0; width: 100%; height: 100%;}";
    
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    NSLog(@"js:\n%@",js);
    [self.webView stringByEvaluatingJavaScriptFromString:js];
    /*
     
     //using javascript to insert css, whenever you are dynamically loading stuff into webviews, you have to use javascript.
    
    
//Here we are creating a text node and inserting it on line 35
    NSString *css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video {position: absolute; top:0; left: 0; width: 100%; height: 100%;}";
    
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    NSLog(@"js:\n%@",js);
    [self.webView stringByEvaluatingJavaScriptFromString:js];
    
    NSString *js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    //we are creating a css style element
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    //Its grabbing the head tag and appending that style node
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n", css];
    NSLog(@"js:\n%@", js);
    //running javascript dynamically on the webpage.
    
    
    [self.webView stringByEvaluatingJavaScriptFromString:js];
    */
}

- (IBAction)donePress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
