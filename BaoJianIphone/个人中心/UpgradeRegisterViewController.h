//
//  UpgradeRegisterViewController.h
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/17.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ELTextField.h"
@interface UpgradeRegisterViewController : BaseViewController
@property (weak, nonatomic) IBOutlet ELTextField *name;
@property (weak, nonatomic) IBOutlet ELTextField *cardid;
@property (weak, nonatomic) IBOutlet ELTextField *region;
@property (weak, nonatomic) IBOutlet ELTextField *memberid;
@property (weak, nonatomic) IBOutlet UIButton *scannerBtn;

@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
@end
