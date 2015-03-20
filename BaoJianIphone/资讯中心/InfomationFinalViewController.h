//
//  InfomationFinalViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface InfomationFinalViewController : BaseViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *content_name;
@property (strong, nonatomic) IBOutlet UILabel *content_time;
@property (strong, nonatomic) IBOutlet UIWebView *mWebView;

@end
