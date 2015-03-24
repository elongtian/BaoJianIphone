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
#import "RegisterProtocolViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"注册";
    
    isAgree = YES;
    
    [_nextbtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchDown];
    
    [_agreeBtn addTarget:self action:@selector(agreeAction:) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer * tapprotocol = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(protocolAction:)];
    [_protcol addGestureRecognizer:tapprotocol];

    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self.view];
    _mScrollView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScrollView)];
    [_mScrollView addGestureRecognizer:tap];
    [_getCodeBtn addTarget:self action:@selector(sendCode:) forControlEvents:UIControlEventTouchDown];
    
}
#pragma mark - 获取验证码
- (void)sendCode:(id)sender{
    [ELRequestSingle registerGetCodeRequest:^(BOOL success,id objc) {
        if(success){
        //
            [self.view makeToast:objc];
        }else{
            [self.view makeToast:objc];
        }
    } Mobile:_mobile.text];
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

- (void)protocolAction:(id)sender{
    //跳转到协议
    RegisterProtocolViewController * protocol = [[RegisterProtocolViewController alloc]initWithNibName:@"RegisterProtocolViewController" bundle:nil];
    [self.navigationController pushViewController:protocol animated:YES];
}

- (void)agreeAction:(id)sender{
    if(isAgree){
        [_agreeBtn setImage:[UIImage imageNamed:@"login_no_select_icon"] forState:UIControlStateNormal];
        _agreeLabel.text = @"不同意";
    }
    else{
        [_agreeBtn setImage:[UIImage imageNamed:@"login_select_icon"] forState:UIControlStateNormal];
        _agreeLabel.text = @"同意";
    }
    isAgree = !isAgree;
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
