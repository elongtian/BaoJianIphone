//
//  LoginViewController.h
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/17.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ELTextField.h"
@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet ELTextField *userNameTextField;
@property (weak, nonatomic) IBOutlet ELTextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPassBtn;

@end
