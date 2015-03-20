//
//  InfoListViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-10.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELRequestSingle.h"
#import "BJObject.h"
#import "UIImageView+AFNetworking.h"
@class InfoListViewController;
typedef void (^InfoListCallBack) (NSIndexPath * indexpath);
@interface InfoListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger page;
   
}
- (void)download;
@property (strong, nonatomic) IBOutlet UITableView *mtableView;
@property (retain, nonatomic) NSString * optionid;
@property (assign, nonatomic) BOOL isbook;
@property (copy, nonatomic) InfoListCallBack callback;
@property (retain, nonatomic)  NSMutableArray * dataArray;
@end
