//
//  IconTextView.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-6.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IconTextView;
typedef void (^IconTextViewCallBack)(IconTextView * view);
@interface IconTextView : UIView
@property (retain, nonatomic) UIImageView * icon;
@property (retain, nonatomic) UILabel * title;
@property (copy, nonatomic) IconTextViewCallBack call_back;
@end
