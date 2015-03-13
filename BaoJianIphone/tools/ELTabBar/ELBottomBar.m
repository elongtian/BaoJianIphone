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
        self.backgroundColor = UIColorFromRGB(0xe3e3e3);
        int width = (SCREENWIDTH-20*4)/3.0;
        for(int i=0; i<Counts; i++)
        {
            ELButton * btn = [ELButton buttonWithType:UIButtonTypeCustom];
            btn.tag = 100+i;
            btn.frame = CGRectMake(0, 0, width, 49);
            btn.center = CGPointMake(20+((width+20)*(i%3)+width/2.0), btn.center.y);
            [btn setImage:[UIImage imageNamed:@"s2"] forState:UIControlStateNormal];
            
            [btn setTitle:@"标题" forState:UIControlStateNormal];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            btn.titleLabel.font = UIFontHiraginoSansGBW3(13);
            [btn setTitleColor:UIColorFromRGB(0x5b5757) forState:UIControlStateNormal];
            btn.tag = 100+i;
            [btn addTarget:self action:@selector(touchDownAction:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)setTitles:(NSMutableArray *)titles
{
    if(_titles == nil)
    {
        _titles = [[NSMutableArray alloc]init];
    }
    _titles = titles;
    
    for(int i = 0;i<Counts; i++){
        ELButton * btn = (ELButton *)[self viewWithTag:100+i];
        [btn setTitle:[_titles objectAtIndex:i] forState:UIControlStateNormal];
    }
}

- (void)setIcons:(NSMutableArray *)icons{
    if(_icons == nil)
    {
        _icons = [[NSMutableArray alloc]init];
    }
    _icons = icons;
    
    for(int i = 0;i<Counts; i++){
        ELButton * btn = (ELButton *)[self viewWithTag:100+i];
        [btn setImage:[UIImage imageNamed:[_icons objectAtIndex:i]] forState:UIControlStateNormal];
    }
}
- (void)touchDownAction:(UIButton *)sender{
    if(self.callback){
        _callback(sender);
    }
}

@end
