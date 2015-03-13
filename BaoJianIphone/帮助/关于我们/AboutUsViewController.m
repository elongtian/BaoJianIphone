//
//  AboutUsViewController.m
//  MaiMaiCircle
//
//  Created by elongtian on 13-12-2.
//  Copyright (c) 2013年 elongtian. All rights reserved.
//

#import "AboutUsViewController.h"


#define TelePhone @"400-080-2300"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.is_push = NO;
    }
    return self;
}
- (void)dealloc
{
//    [navBar release];/Users/elongtian/ilpUser/ilpUser/更多/关于我们/AboutUsViewController.m
//    [_mwebView release];
//    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    self.navbar.titleLabel.text = @"关于我们";
    
    _mwebView.scalesPageToFit = NO;
    
    
    [_callBtn addTarget:self action:@selector(callAction:) forControlEvents:UIControlEventTouchDown];
    
//    self.indicator = [[ActivityIndicator alloc] initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, SCREENHEIGHT-NAVHEIGHT) LabelText:LOADING withdelegate:self withType:ActivityIndicatorDefault andAction:@selector(refresh)];
//    [self.indicator startAnimatingActivit];
//    [self.view addSubview:self.indicator];
    
    [self refresh];
}
- (void)callAction:(UIButton *)btn
{
    UIWebView*callWebview =[[UIWebView alloc] init];
    
    NSString *telUrl = [NSString stringWithFormat:@"tel:%@",TelePhone];
    
    NSURL *telURL =[NSURL URLWithString:telUrl];// 貌似tel:// 或者 tel: 都行
    
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [self.view addSubview:callWebview];

}

- (void)refresh
{
//    [self.indicator startAnimatingActivit];
  
    NSString * url = [NSString stringWithFormat:@"%@&%@",HTTP,nil];
    [[ELHttpRequestOperation sharedClient]GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)responseObject;
            [_mwebView loadHTMLString:[dic objectForKey:@"content_body"] baseURL:nil];
//        [self.indicator LoadSuccess];
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [self.indicator abnormalButtonShow:[UIImage imageNamed:@"no_net"] text:NO_NET_DESC];
    }];
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    [self.indicator LoadSuccess];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

#pragma mark - Jr
- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
