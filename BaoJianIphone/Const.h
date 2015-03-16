//
//  Const.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#ifndef BaoJianIphone_Const_h
#define BaoJianIphone_Const_h


#define SCREENWIDTH      CGRectGetWidth([UIScreen mainScreen].bounds)
#define SCREENHEIGHT      CGRectGetHeight([UIScreen mainScreen].bounds)
#define DELE [[UIApplication sharedApplication] delegate]
#define IOS7 [[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7

#define IOS8 [[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=8

#define NSLogFrame(v) NSLog(@"%f,%f,%f,%f",v.frame.origin.x,v.frame.origin.y,v.frame.size.width,v.frame.size.height);

#define BackGround_Color UIColorFromRGB(0xeaeaea)

#define NSStringFromJson(v) (([v isEqual:[NSNull null]])?@"":v)
#define OBJC(v) (([v isEqual:[NSNull null]])?nil:v)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#ifdef DEBUG
# define DLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif

#define UIFontHiraginoSansGBW3(s) ([UIFont fontWithName:@"HiraginoSansGB-W3"size:s])
#define UIFontHiraginoSansGBW6(s) ([UIFont fontWithName:@"HiraginoSansGB-W6"size:s])


#define APPID @"921848523"

#define NAVHEIGHT (IOS7?64:44)
#define IphoneHeight [UIScreen mainScreen].bounds.size.height

#define USER_NAME @"user"
#define USER_PWD @"pwd"

#define LOADING @"正在加载..."

#define NO_MORE_DATA @"就这么多了"

#define NO_NET @"请检查您的网络"
#define NO_NET_DESC @"数据加载失败!"
#define NO_DATA_DESC @"暂无数据!"
#define ADD_SHOPCAR_SUCCESS @"添加购物车成功"

#define NSUserDefault_USER ([[NSUserDefaults standardUserDefaults] objectForKey:@"user"])
#define NSUserDefault_PWD ([[NSUserDefaults standardUserDefaults] objectForKey:@"pwd"])

#define AreRemember @"isRemember"
#define is_Remember_Bool YES


#import "JRNavgationBar.h"
#import "ELHttpRequestOperation.h"
#import "Toast+UIView.h"
#import "NSString+Addtion.h"

#import "BJObject.h"

#define HTTP @"http://www.ipaosos.com/app/index.php?com=com_appService"
//首页轮播
#define HomeAdUrl @"&method=save&app_com=com_lbsapp&task=Appadd"


#endif
