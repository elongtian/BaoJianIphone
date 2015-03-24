//
//  LoginViewController.m
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/17.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MemberCenterViewController.h"
#import "FindBackWordTypeViewController.h"
#import "FileMangerObject.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.navbar.titleLabel.text = @"用户登录";
    
    [self.navbar.homebtn setTitle:@"注册" forState:UIControlStateNormal];
    
    [_sureBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchDown];
    [_forgotPassBtn addTarget:self action:@selector(forgotPassWord:) forControlEvents:UIControlEventTouchDown];
}

- (void)loginAction:(id)sender{
    [self.view endEditing:YES];
    [ELRequestSingle loginRequest:^(BOOL sucess, id objc) {
        if(sucess){
            MemberCenterViewController * member = [[MemberCenterViewController alloc]initWithNibName:@"MemberCenterViewController" bundle:nil];
            [self.navigationController pushViewController:member animated:YES];
        }else{
            
        }
        [self.view makeToast:objc];
    } ID:[_userNameTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] AndPassWord: [FileMangerObject md5:_passWordTextField.text]];
    
}

- (void)home:(id)sender{
//跳转到注册界面
    RegisterViewController * regist = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:regist animated:YES];
}

- (void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_userNameTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
}

- (void)forgotPassWord:(UIButton *)sender{
    FindBackWordTypeViewController * findtype = [[FindBackWordTypeViewController alloc]initWithNibName:@"FindBackWordTypeViewController" bundle:nil];
    [self.navigationController pushViewController:findtype animated:YES];
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
