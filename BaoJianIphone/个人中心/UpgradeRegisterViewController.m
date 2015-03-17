//
//  UpgradeRegisterViewController.m
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/17.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "UpgradeRegisterViewController.h"
#import "RegistCompletedViewController.h"
@interface UpgradeRegisterViewController ()

@end

@implementation UpgradeRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"注册宝健之友";
    [_doneBtn addTarget:self action:@selector(registDone:) forControlEvents:UIControlEventTouchDown];
}

- (void)registDone:(UIButton *)sender{
    //确认完成
    RegistCompletedViewController * complete = [[RegistCompletedViewController alloc]initWithNibName:@"RegistCompletedViewController" bundle:nil];
    [self.navigationController pushViewController:complete animated:YES];
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
