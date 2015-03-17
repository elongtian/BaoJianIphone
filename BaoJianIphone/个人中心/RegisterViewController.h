//
//  RegisterViewController.h
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/17.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface RegisterViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *passwordtwo;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UILabel *protcol;
@property (weak, nonatomic) IBOutlet UIButton *nextbtn;
@end
