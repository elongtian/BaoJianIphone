//
//  ReuseScrollView.h
//  ScrollReuse
//
//  Created by zhangqingfeng on 13-10-17.
//  Copyright (c) 2013年 zhangqingfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReuseScrollView;
@protocol  ReuseScrollViewDelegate <NSObject>
@optional

//得到视图的页数
- (NSInteger)numberOfViewInReuseScrollView:(ReuseScrollView *)reusrScroll;

//加载每一页的视图
- (UIView *)reuseScrollView:(ReuseScrollView *)reusrScroll viewForLocationAtPage:(NSInteger)page;

@end


@interface ReuseScrollView : UIScrollView
{
    BOOL cycleSlip; //是否进行循环，默认为NO
}

@property (nonatomic, weak) id<ReuseScrollViewDelegate>reuseDelegate;
@property (assign) float pageWidth; //页面的宽度


//重写cycleSlip的set和get方法
- (BOOL)cycleSlip;
- (void)setCycleSlip:(BOOL)cycle;


//加载视图
- (void)loadView;

//重载视图
- (void)overloadedViews;

//获取可重用的视图
- (id)getReusableView;

//清空可重用的视图
- (void)removeReusableView;




@end
