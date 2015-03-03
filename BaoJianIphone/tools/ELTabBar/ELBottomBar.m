//
//  ELBottomBar.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "ELBottomBar.h"
#import "ELButton.h"
#import "Const.h"
#define Counts 3

@implementation ELBottomBar
- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor yellowColor];
        int width = (SCREENWIDTH-20*4)/3.0;
        for(int i=0; i<Counts; i++)
        {
            ELButton * btn = [ELButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor orangeColor];
            btn.frame = CGRectMake(0, 0, 49, 49);
            btn.center = CGPointMake(20+((width+20)*(i%3)+width/2.0), btn.center.y);
            [btn setImage:[UIImage imageNamed:@"s2"] forState:UIControlStateNormal];
            [btn setTitle:@"标题" forState:UIControlStateNormal];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:btn];
        }
    }
    return self;
}
@end
