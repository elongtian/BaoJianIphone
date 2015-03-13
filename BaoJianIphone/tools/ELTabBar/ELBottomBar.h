//
//  ELBottomBar.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ELBottomBarCallBack) (UIButton * sender);

@interface ELBottomBar : UIView
@property (retain, nonatomic) NSMutableArray * titles;
@property (retain, nonatomic) NSMutableArray * icons;
@property (copy, nonatomic) ELBottomBarCallBack callback;
@end
