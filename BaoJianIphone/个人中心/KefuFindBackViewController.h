//
//  KefuFindBackViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface KefuFindBackViewController : BaseViewController{
    UIWebView * phoneCallWebView;
}
@property (strong, nonatomic) IBOutlet UILabel *kefu_teleL;
@property (strong, nonatomic) IBOutlet UIButton *bjcopyBtn;

@end
