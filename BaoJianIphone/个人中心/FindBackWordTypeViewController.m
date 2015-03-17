//
//  FindBackWordTypeViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "FindBackWordTypeViewController.h"
#import "KefuFindBackViewController.h"
#import "MobileFindBackViewController.h"
@interface FindBackWordTypeViewController ()

@end

@implementation FindBackWordTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"找回密码";
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mobileSelect:)];
    [_mobileSelectView addGestureRecognizer:tap];
    
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(kefuSelect:)];
    [_kefuSelectView addGestureRecognizer:tap2];
}

- (void)mobileSelect:(UITapGestureRecognizer *)tap{
    MobileFindBackViewController * mobile = [[MobileFindBackViewController alloc]initWithNibName:@"MobileFindBackViewController" bundle:nil];
    [self.navigationController pushViewController:mobile animated:YES];
}
- (void)kefuSelect:(UITapGestureRecognizer *)tap{
    KefuFindBackViewController * kefu = [[KefuFindBackViewController alloc]initWithNibName:@"KefuFindBackViewController" bundle:nil];
    [self.navigationController pushViewController:kefu animated:YES];
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
