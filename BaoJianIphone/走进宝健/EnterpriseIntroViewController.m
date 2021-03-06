//
//  EnterpriseIntroViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "EnterpriseIntroViewController.h"

@interface EnterpriseIntroViewController ()

@end

@implementation EnterpriseIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"企业简介";
    [self.navbar.homebtn setImage:[UIImage imageNamed:@"share_icon"] forState:UIControlStateNormal];
    
    [self download];
}

- (void)download{
    [ELRequestSingle articleDetailRequest:^(BOOL success,id objc) {
        
        BJObject * object = (BJObject *)objc;
        [_mWebView loadHTMLString:object.content_body baseURL:nil];
    } withObject:self.optionid];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    [_mWebView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#EDF0EB'"];
}

- (void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
