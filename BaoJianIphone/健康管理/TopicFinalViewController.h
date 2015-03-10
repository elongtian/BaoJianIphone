//
//  TopicFinalViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface TopicFinalViewController : BaseViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (strong, nonatomic) IBOutlet UILabel *content_nameL;
@property (strong, nonatomic) IBOutlet UILabel *content_timeL;
@property (strong, nonatomic) IBOutlet UIButton *zanNumL;
@property (strong, nonatomic) IBOutlet UIWebView *mainwebView;
@property (strong, nonatomic) IBOutlet UILabel *evaluateL;
@property (strong, nonatomic) IBOutlet UITableView *maintableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *webHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollEndDistance;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleViewWidth;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *maintableViewHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *content_nameWidth;

@end
