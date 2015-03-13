//
//  TestResultViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface TestResultViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UITableView *maintableView;
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *test_bg;
@property (strong, nonatomic) IBOutlet UILabel *questionL;
@property (strong, nonatomic) IBOutlet UILabel *testNameL;
@property (strong, nonatomic) IBOutlet UILabel *resultL;
@property (strong, nonatomic) IBOutlet UIButton *againBtn;
@property (strong, nonatomic) IBOutlet UIButton *moreBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topViewHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topViewWidth;

@end
