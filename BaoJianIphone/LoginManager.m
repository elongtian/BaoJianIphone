//
//  LoginManager.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-19.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "LoginManager.h"
static LoginManager * manager;

@implementation LoginManager
+ (id)shareManager{
    if(manager == nil){
        manager = [[LoginManager alloc]init];
    }
    return manager;
}
@end
