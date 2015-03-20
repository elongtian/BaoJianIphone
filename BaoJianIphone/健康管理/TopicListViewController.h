//
//  TopicListViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface TopicListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * dataArray;
    NSInteger page;
}
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@end
