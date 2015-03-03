//
//  HomeChannelView.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "HomeChannelView.h"
#define TOPDistance 20.0f

#define imgV_Width 30.f
#define imgV_height 30.f

#define titleL_Width 80.f
#define titleL_Height 30.f

@implementation HomeChannelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor greenColor];
        [self layoutViews];
        [self addTarget];
    }
    return self;
}

- (void)layoutViews
{
    _imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, TOPDistance, imgV_Width,  imgV_height)];
    _imgV.backgroundColor = [UIColor redColor];
    _imgV.center = CGPointMake(self.frame.size.width/2, _imgV.center.y);
    
    _titleL = [[UILabel alloc]initWithFrame:CGRectMake(0, _imgV.frame.origin.y+_imgV.frame.size.height, self.frame.size.width, titleL_Height)];
    _titleL.textAlignment = NSTextAlignmentCenter;
    _titleL.textColor = [UIColor whiteColor];
    _titleL.font = [UIFont boldSystemFontOfSize:14.f];
    _titleL.text = @"走进宝健";
    
    [self addSubview:_imgV];
    [self addSubview:_titleL];
    
}

- (void)addTarget
{
    _imgV.userInteractionEnabled = YES;
    _titleL.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}
- (void)tap:(UITapGestureRecognizer *)tap
{
    if(self.call_back)
    {
        _call_back(self);
    }
}

@end
