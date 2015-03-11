//
//  PanoramaFinalViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ReuseScrollView.h"
@interface PanoramaFinalViewController : BaseViewController<ReuseScrollViewDelegate, UIScrollViewDelegate>{
    NSMutableArray *_imageViews;
}
@property (nonatomic, strong) ReuseScrollView *myScrollView;
@end
