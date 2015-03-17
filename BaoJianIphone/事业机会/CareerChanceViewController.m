//
//  CareerChanceViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "CareerChanceViewController.h"

@interface CareerChanceViewController ()

@end

@implementation CareerChanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"事业机会";
    self.bottom_logoV.hidden = NO;
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
