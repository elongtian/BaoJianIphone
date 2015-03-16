//
//  TestListViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface TestListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    CGFloat cellHeight;
}
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@end
