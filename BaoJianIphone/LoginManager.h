//
//  LoginManager.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-19.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginManager : NSObject
@property (retain, nonatomic) NSString * username;//登录用户名(卡号或者手机号)
@property (retain, nonatomic) NSString * password;//登录密码
@property (assign, nonatomic) BOOL state;//登录状态
+ (id)shareManager;

@end
