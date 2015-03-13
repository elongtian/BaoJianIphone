//
//  AboutUsViewController.h
//  MaiMaiCircle
//
//  Created by elongtian on 13-12-2.
//  Copyright (c) 2013年 elongtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface AboutUsViewController : BaseViewController<UIWebViewDelegate>
{
}
@property (retain, nonatomic) IBOutlet UIWebView *mwebView;
@property (retain, nonatomic) NSString * content_body;
@property (assign, nonatomic) BOOL  is_push;
@property (strong, nonatomic) IBOutlet UIButton *callBtn;
@end
