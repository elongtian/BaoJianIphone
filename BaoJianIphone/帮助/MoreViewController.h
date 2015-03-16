//
//  MoreViewController.h
//  ilpUser
//
//  Created by elongtian on 14-6-16.
//  Copyright (c) 2014年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
@interface MoreViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    JRNavgationBar * navBar;
}
@property (strong, nonatomic) IBOutlet UITableView *mtableview;
@property (retain, nonatomic) NSArray * tags;
@property (strong, nonatomic) IBOutlet UILabel *bundleLabel;
@end
