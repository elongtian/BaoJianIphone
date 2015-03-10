//
//  TopicListTableViewCell.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-9.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicListTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *content_img;
@property (strong, nonatomic) IBOutlet UILabel *content_title;
@property (strong, nonatomic) IBOutlet UILabel *content_desc;
@property (strong, nonatomic) IBOutlet UILabel *content_time;
@property (strong, nonatomic) IBOutlet UIButton *zanNum;
@property (strong, nonatomic) IBOutlet UILabel *evaluates;

@end
