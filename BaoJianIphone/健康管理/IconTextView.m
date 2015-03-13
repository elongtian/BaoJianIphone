//
//  IconTextView.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-6.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "IconTextView.h"
#import "NSString+Addtion.h"
@implementation IconTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self initPlat];
    }
    return self;
}

- (void)initPlat{
    _icon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    _icon.image = [UIImage imageNamed:@"pro_search_icon"];
    _icon.contentMode = UIViewContentModeCenter;
    _title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    _title.numberOfLines = 0;
    _title.text = @"请输入商品名称";
    
    CGSize size = [_title.text getcontentsizeWithfont:_title.font constrainedtosize:CGSizeMake(self.frame.size.width, self.frame.size.height) linemode:NSLineBreakByCharWrapping];
    
    _title.frame = CGRectMake(0, 0, size.width, size.height);
    
    _title.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    _icon.frame = CGRectMake(_title.frame.origin.x-25, _title.frame.origin.y, _icon.frame.size.width, _icon.frame.size.height);
    
    [self addSubview:_icon];
    
    [self addSubview:_title];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSelf:)];
    _title.userInteractionEnabled = YES;
    _icon.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
    
}

- (void)tapSelf:(UITapGestureRecognizer *)tap{
    if(self.call_back){
        _call_back(self);
    }
}

@end
