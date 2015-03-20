//
//  EnterBaoJianViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "Const.h"
#import "JCTopic.h"
#import "StyledPageControl.h"
@interface EnterBaoJianViewController : BaseViewController<JCTopicDelegate>
{
    NSMutableArray * titles;
    UIView * descripView;
    NSMutableArray * icons;
    NSMutableArray * colors;
    NSArray * channelArray;
}
@property (retain, nonatomic) JCTopic * Topic;
@property (retain, nonatomic) UIScrollView * mainScrollView;
@property (retain, nonatomic) NSMutableArray * pics;
@property (retain, nonatomic) StyledPageControl * pageView;
@end
