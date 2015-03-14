//
//  SearchResultShowViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-14.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface SearchResultShowViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@end
