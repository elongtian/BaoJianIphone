//
//  EnterpriseFeaturesViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface EnterpriseFeaturesViewController : BaseViewController
{
    NSMutableArray * titles;
    NSMutableArray * icons;
    NSMutableArray * colors;
    NSArray * channelArray;
}
@property (retain, nonatomic) UIScrollView * mainScrollView;
@property (retain, nonatomic) UIImageView * TopicIMageView;
@end
