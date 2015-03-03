//
//  HomeChannelView.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeChannelView;
typedef void (^CallBack)(HomeChannelView * view);

@interface HomeChannelView : UIView
@property (retain, nonatomic) UIImageView * imgV;
@property (retain, nonatomic) UILabel * titleL;
@property (assign, nonatomic) NSInteger tag;
@property (copy, nonatomic) CallBack call_back;
@end
