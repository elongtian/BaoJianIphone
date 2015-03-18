//
//  RegisterViewController.m
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/17.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "RegisterViewController.h"
#import "UpgradeRegisterViewController.h"
#import "DaiDodgeKeyboard.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"注册";
    
    [_nextbtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchDown];
    
//     [inputHelper setupInputHelperForView:_mScrollView withDismissType:InputHelperDismissTypeTapGusture];
//    _mScrollViewWidth.constant = SCREENWIDTH;
//    _mScrollView.contentSize = CGSizeMake(SCREENWIDTH, _mScrollView.frame.size.height);
    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self.view];
    _mScrollView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScrollView)];
    [_mScrollView addGestureRecognizer:tap];
}
- (void)tapScrollView{
    [self.view endEditing:YES];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)nextAction:(UIButton *)sender{
    //下一步
    UpgradeRegisterViewController * upgrade = [[UpgradeRegisterViewController alloc]initWithNibName:@"UpgradeRegisterViewController" bundle:nil];
    [self.navigationController pushViewController:upgrade animated:YES];
    
    
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
