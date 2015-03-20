//
//  BookChapterListViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-20.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface BookChapterListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * dataArray;
}
@property (strong, nonatomic) IBOutlet UITableView *mTableView;

@end
