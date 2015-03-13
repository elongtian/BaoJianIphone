//
//  AboutAppViewController.m
//  ilpUser
//
//  Created by elongtian on 14-6-23.
//  Copyright (c) 2014年 madongkai. All rights reserved.
//

#import "AboutAppViewController.h"

@interface AboutAppViewController ()

@end

@implementation AboutAppViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    self.navbar.titleLabel.text = @"关于应用";
    
    
    
    
//    self.indicator = [[ActivityIndicator alloc] initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, SCREENHEIGHT-NAVHEIGHT) LabelText:LOADING withdelegate:self withType:ActivityIndicatorDefault andAction:@selector(refresh)];
//    [self.indicator startAnimatingActivit];
//    [self.view addSubview:self.indicator];
//    
    [self refresh];
}

- (void)refresh
{
//    [self.indicator startAnimatingActivit];
    NSString * url = [NSString stringWithFormat:@"%@&%@",HTTP,nil];
    [[ELHttpRequestOperation sharedClient]GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)responseObject;
            [_mwebview loadHTMLString:[dic objectForKey:@"content_body"] baseURL:nil];
//            [self.indicator LoadSuccess];
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
