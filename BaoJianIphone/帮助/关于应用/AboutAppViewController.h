//
//  AboutAppViewController.h
//  ilpUser
//
//  Created by elongtian on 14-6-23.
//  Copyright (c) 2014年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface AboutAppViewController : BaseViewController<UIWebViewDelegate>
{
}
@property (strong, nonatomic) IBOutlet UIWebView *mwebview;

@end
