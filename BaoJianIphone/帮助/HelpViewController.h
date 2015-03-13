//
//  HelpViewController.h
//  ilpUser
//
//  Created by elongtian on 15-1-21.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface HelpViewController : BaseViewController<UIWebViewDelegate>
{
    
}
@property (strong, nonatomic) IBOutlet UIWebView *mwebview;

@end
