//
//  ReuseScrollView.m
//  ScrollReuse
//
//  Created by zhangqingfeng on 13-10-17.
//  Copyright (c) 2013年 zhangqingfeng. All rights reserved.
//

#import "ReuseScrollView.h"

@interface ReuseScrollView()

@property (nonatomic, strong) NSMutableDictionary *reuseViews;//可重用的视图

@property (nonatomic, strong) NSMutableDictionary *showViews;//显示出来的页面

@property (nonatomic, assign) NSInteger pages;



@end

@implementation ReuseScrollView

#pragma mark -
- (void)dealloc
{
    self.delegate = nil;
    self.reuseViews = nil;//可重用的视图
    self.showViews = nil;//显示出来的页面
    [self removeObserver:self forKeyPath:@"contentOffset"];
}


#pragma mark -
#pragma mark-重写cycleSlip的set和get方法
- (BOOL)cycleSlip{
    return cycleSlip;
};

- (void)setCycleSlip:(BOOL)cycle{
    cycleSlip = cycle;
    
    if (self.cycleSlip) {
        
        if (self.contentSize.width > 0) {
            [self setContentSize:CGSizeMake(self.contentSize.width * 100, self.contentSize.height)];
        }
        else{
            [self setContentSize:CGSizeMake(self.frame.size.width + 1, self.contentSize.height)];
        }
    }
    else{
        float width = (self.pageWidth == 0) ? self.frame.size.width : self.pageWidth;
        
        [self setContentSize:CGSizeMake(width * self.pages, self.contentSize.height)];
    }
}


#pragma mark -
#pragma mark-初始化方法
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.showViews = [[NSMutableDictionary alloc] init];
        self.reuseViews = [[NSMutableDictionary alloc] init];
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"contentOffset"]&&_isobserver){
        [self loadView];
    }
}

#pragma mark-
#pragma mark-开始绘制视图
- (void)drawRect:(CGRect)rect
{
    //得到子视图和页数
    if ([self.reuseDelegate respondsToSelector:@selector(numberOfViewInReuseScrollView:)]) {
        self.pages = [self.reuseDelegate numberOfViewInReuseScrollView:self];
    }
    
    //设置视图内容大小
    if (self.cycleSlip) {
        
        if (self.contentSize.width > 0) {
            [self setContentSize:CGSizeMake(self.contentSize.width * 100, self.contentSize.height)];
        }
        else{
            [self setContentSize:CGSizeMake(self.frame.size.width + 1, self.contentSize.height)];
        }
    }
    else{
        float width = (self.pageWidth == 0) ? self.frame.size.width : self.pageWidth;
        
        [self setContentSize:CGSizeMake(width * self.pages, self.contentSize.height)];
    }
    
    //加载视图
    [self loadView];
}


#pragma mark -
#pragma mark-加载视图
- (void)loadView{
    
    //确定子视图的宽度
    float width = self.pageWidth == 0 ? self.frame.size.width : self.pageWidth;
    
    NSInteger firstNeededPageIndex = floorf(CGRectGetMinX(self.bounds) / width);
    NSInteger lastNeededPageIndex  = floorf((CGRectGetMaxX(self.bounds)-1) / width);
    
    firstNeededPageIndex = MAX(firstNeededPageIndex, 0);
    if (self.pages > 0 && !self.cycleSlip) {
        lastNeededPageIndex  = MIN(lastNeededPageIndex, self.pages - 1);
    }
    
    //回收不可见页面
    for (NSString *pageString in self.showViews) {
        if ([pageString intValue] < firstNeededPageIndex || [pageString intValue] > lastNeededPageIndex) {
            
            //得到已滑出窗口的页面
            id page = self.showViews[pageString];
            
            //将已滑出窗口的页面加入待重用词典中
            [self.reuseViews setObject:page forKey:pageString];
            
            //将页面从视图页面中移除
            [page removeFromSuperview];
            page = nil;
        }
    }
    
    
    //将已滑出窗口页面的从显示视图词典中删除
    [self.showViews removeObjectsForKeys:[self.reuseViews allKeys]];
    

    //添加缺页
    for (NSInteger index = firstNeededPageIndex; index <= lastNeededPageIndex; index++) {
        //判断页面是否已显示
        if (![self isDisplayingPageForIndex:index]) {
            //加载一个新的页面出来（通过代理）
            if ([self.reuseDelegate respondsToSelector:@selector(reuseScrollView:viewForLocationAtPage:)]) {
                
                UIView *view = [self.reuseDelegate reuseScrollView:self viewForLocationAtPage:index % self.pages];
                
                view.frame=CGRectMake(width * index, 0, width, self.frame.size.height);
                [self addSubview:view];
                [self.showViews setObject:view forKey:[NSString stringWithFormat:@"%ld",(long)index]];
                view = nil;
            }
        }
    }
}

//判断页面是否已显示
- (BOOL)isDisplayingPageForIndex:(NSUInteger)index
{
    BOOL foundPage = NO;
    for (NSString *indexString in self.showViews) {
        if ([indexString intValue] == index) {
            foundPage = YES;
            break;
        }
    }
    return foundPage;
}

#pragma mark -
#pragma mark-重载页面
- (void)overloadedViews{
    
    [self.showViews removeAllObjects];
    [self.reuseViews removeAllObjects];
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    //得到子视图和页数
    if ([self.reuseDelegate respondsToSelector:@selector(numberOfViewInReuseScrollView:)]) {
        self.pages = [self.reuseDelegate numberOfViewInReuseScrollView:self];
    }
    
    //设置视图内容大小
    if (self.cycleSlip) {
        
        if (self.contentSize.width > 0) {
            [self setContentSize:CGSizeMake(self.contentSize.width * 100, self.contentSize.height)];
            
            [self setContentOffset:CGPointMake(self.contentOffset.x + self.contentSize.width * 50, self.contentOffset.y)];

        }
        else{
            [self setContentSize:CGSizeMake(self.frame.size.width + 1, self.contentSize.height)];
        }
    }
    else{
        float width = (self.pageWidth == 0) ? self.frame.size.width : self.pageWidth;
        
        [self setContentSize:CGSizeMake(width * self.pages, self.contentSize.height)];
    }

    //加载视图
    [self loadView];
}


#pragma mark -
#pragma mark-获取可重用的视图
- (id)getReusableView{
    
    id view = nil;
    
    if ([self.reuseViews allKeys].count > 0) {
        
        view = self.reuseViews[[self.reuseViews allKeys][0]];
        
        [self.reuseViews removeObjectForKey:[self.reuseViews allKeys][0]];
    }
    
    return view;
}

#pragma mark -
#pragma mark -清空可重用的视图
- (void)removeReusableView{
    [self.reuseViews removeAllObjects];
}



@end
