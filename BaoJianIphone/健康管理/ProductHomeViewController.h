//
//  ProductHomeViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "JCTopic.h"
#import "StyledPageControl.h"
@interface ProductHomeViewController : BaseViewController<JCTopicDelegate,UIScrollViewDelegate>
{
    NSMutableArray * titles;
}
@property (retain, nonatomic) UIScrollView * mainScrollView;
@property (retain, nonatomic) JCTopic * Topic;
@property (retain, nonatomic) StyledPageControl * pageView;
@property (retain, nonatomic) NSMutableArray * pics;

@end
