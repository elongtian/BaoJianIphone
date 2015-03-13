//
//  ProductListTableViewCell.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-5.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *content_img;
@property (strong, nonatomic) IBOutlet UILabel *content_name;
@property (strong, nonatomic) IBOutlet UILabel *content_desc1;
@property (strong, nonatomic) IBOutlet UILabel *content_desc2;
@property (strong, nonatomic) IBOutlet UILabel *content_price;
@property (strong, nonatomic) IBOutlet UILabel *price;

@end
