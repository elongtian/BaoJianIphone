//
//  MoreViewController.h
//  ilpUser
//
//  Created by elongtian on 14-6-16.
//  Copyright (c) 2014年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "MyModifyViewController.h"
#import "AppDelegate.h"
@interface MoreViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,MyModifyDelegate>
{
    JRNavgationBar * navBar;
}
@property (strong, nonatomic) IBOutlet UITableView *mtableview;
@property (retain, nonatomic) NSArray * tags;
@property (strong, nonatomic) IBOutlet UILabel *bundleLabel;
@end
