//
//  KefuFindBackViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "KefuFindBackViewController.h"

@interface KefuFindBackViewController ()

@end

@implementation KefuFindBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"客服找回密码";
    
//    NSArray * arr1 = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
//    NSArray * arr2 = [NSArray arrayWithObjects:@"a",@"b",@"c", nil];
//    NSArray * arr3 = [NSArray arrayWithObjects:@"A",@"B",@"C", nil];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callAction:)];
    _kefu_teleL.userInteractionEnabled = YES;
    [_kefu_teleL addGestureRecognizer:tap];
    
    [_bjcopyBtn addTarget:self action:@selector(bjcopyAction:) forControlEvents:UIControlEventTouchDown];
}

- (void)bjcopyAction:(UIButton *)sender{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = _kefu_teleL.text;
    [self.view makeToast:@"已复制到粘贴板"];
}

- (void)callAction:(UITapGestureRecognizer *)tap{
    NSString *phoneNum = _kefu_teleL.text;// 电话号码
    
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    
    if ( !phoneCallWebView ) {
        
        phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];// 这个webView只是一个后台的容易 不需要add到页面上来  效果跟方法二一样 但是这个方法是合法的
        
    }
    
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];

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
