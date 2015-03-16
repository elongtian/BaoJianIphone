//
//  MemberCenterViewController.h
//  BaoJianIphone
//
//  Created by 马东凯 on 15/3/16.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"

@interface MemberCenterViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * entryArray;
}
@property (weak, nonatomic) IBOutlet UIImageView *headImgV;
@property (weak, nonatomic) IBOutlet UILabel *memberName;
@property (weak, nonatomic) IBOutlet UILabel *memberlevel;
@property (weak, nonatomic) IBOutlet UIButton *redHeart;
@property (weak, nonatomic) IBOutlet UITableView *maintableView;

@end
