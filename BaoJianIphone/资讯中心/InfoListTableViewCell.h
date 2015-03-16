//
//  InfoListTableViewCell.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-10.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoListTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *content_img;
@property (strong, nonatomic) IBOutlet UILabel *content_name;
@property (strong, nonatomic) IBOutlet UILabel *content_desc;
@property (strong, nonatomic) IBOutlet UILabel *content_time;

@end
