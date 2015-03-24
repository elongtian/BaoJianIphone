//
//  CareerFinalViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-23.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface CareerFinalViewController : BaseViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *content_name;
@property (strong, nonatomic) IBOutlet UILabel *content_time;
@property (strong, nonatomic) IBOutlet UIWebView *mWebView;
@end
