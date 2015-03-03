//
//  PanoramaListViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "PanoramaListCell.h"
@interface PanoramaListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (retain, nonatomic) NSMutableArray * photosArray;
@property (retain, nonatomic) PanoramaListCell * panoramaListCell;

@end
