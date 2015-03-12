//
//  HomeViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-11.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "JCTopic.h"
#import "StyledPageControl.h"
@interface HomeViewController : BaseViewController<JCTopicDelegate,UIScrollViewDelegate>
{
    NSMutableArray * titles;
    NSMutableArray * icons;
    NSMutableArray * colors;
}
@property (retain, nonatomic) UIScrollView * mainScrollView;
@property (retain, nonatomic) JCTopic * Topic;
@property (retain, nonatomic) StyledPageControl * pageView;
@property (retain, nonatomic) NSMutableArray * pics;
@end
