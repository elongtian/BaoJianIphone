//
//  RegisterProtocolViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-19.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "RegisterProtocolViewController.h"

@interface RegisterProtocolViewController ()

@end

@implementation RegisterProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navbar.titleLabel.text = @"宝健个人服务协议";
    
    [ELRequestSingle registerprotocolRequest:^(BOOL sucess, id objc) {
        BJObject * obj = (BJObject *)objc;
        [_mWebView loadHTMLString:obj.content_body baseURL:nil];
    }];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
