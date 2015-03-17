//
//  UpgradeRegisterViewController.h
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/17.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface UpgradeRegisterViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *cardid;
@property (weak, nonatomic) IBOutlet UITextField *region;
@property (weak, nonatomic) IBOutlet UITextField *memberid;
@property (weak, nonatomic) IBOutlet UIButton *scannerBtn;

@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
@end
