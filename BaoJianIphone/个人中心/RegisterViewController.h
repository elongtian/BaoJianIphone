//
//  RegisterViewController.h
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/17.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ELTextField.h"
@interface RegisterViewController : BaseViewController
@property (strong, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (weak, nonatomic) IBOutlet ELTextField *mobile;
@property (weak, nonatomic) IBOutlet ELTextField *code;
@property (weak, nonatomic) IBOutlet ELTextField *password;

@property (weak, nonatomic) IBOutlet ELTextField *passwordtwo;
@property (weak, nonatomic) IBOutlet ELTextField *email;
@property (strong, nonatomic) IBOutlet UILabel *agreeLabel;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UILabel *protcol;
@property (weak, nonatomic) IBOutlet UIButton *nextbtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mScrollViewWidth;
@end
