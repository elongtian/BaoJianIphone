//
//  TestFinalViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ReuseScrollView.h"
@interface TestFinalViewController : BaseViewController<ReuseScrollViewDelegate,UIScrollViewDelegate>{
    NSInteger numbers;
    NSInteger current_index;
}
@property (strong, nonatomic) IBOutlet UIImageView *topLineView;
@property (strong, nonatomic) IBOutlet UIView *mainContentView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIButton *forwardBtn;
@property (strong, nonatomic) IBOutlet UILabel *testName;
@property (strong, nonatomic) IBOutlet UIImageView *testicon;
@property (strong, nonatomic) IBOutlet UIView *topSelectView;
@property (strong, nonatomic) IBOutlet UIButton *selected_btn;

@property (retain, nonatomic) ReuseScrollView * mainScrollView;
@end
