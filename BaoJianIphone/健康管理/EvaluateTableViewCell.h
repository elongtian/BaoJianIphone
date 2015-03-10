//
//  EvaluateTableViewCell.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-9.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *content_img;
@property (strong, nonatomic) IBOutlet UILabel *content_name;
@property (strong, nonatomic) IBOutlet UILabel *content_time;
@property (strong, nonatomic) IBOutlet UIView *evaluateView;
@property (strong, nonatomic) IBOutlet UILabel *content_name2;
@property (strong, nonatomic) IBOutlet UILabel *content_time2;
@property (strong, nonatomic) IBOutlet UILabel *content_desc2;
@property (strong, nonatomic) IBOutlet UILabel *content_desc;

@end
