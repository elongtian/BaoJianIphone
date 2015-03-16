//
//  BaseViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-11.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Const.h"
@interface BaseViewController : UIViewController<JRNavDelegate>{
    
}
@property (retain, nonatomic) JRNavgationBar * navbar;
@property (retain, nonatomic) UIImageView * bottom_logoV;
@property (retain, nonatomic) NSString * titleName;
//@property (retain, nonatomic) acti
@end
