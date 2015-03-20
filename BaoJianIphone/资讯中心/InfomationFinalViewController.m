//
//  InfomationFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "InfomationFinalViewController.h"

@interface InfomationFinalViewController ()

@end

@implementation InfomationFinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)download{
    [ELRequestSingle newsDetailRequest:^(id objc) {
        BJObject * object = (BJObject *)objc;
        _content_name.text = object.content_name;
        _content_time.text = object.create_time;
        [_mWebView loadHTMLString:object.content_body baseURL:nil];
    } withOptionId:self.optionid];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

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
