//
//  ProductListViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ELTextField.h"
@interface ProductListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIButton *scannerBtn;
@property (strong, nonatomic) IBOutlet ELTextField *searchField;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong, nonatomic) IBOutlet UIView *salesView;
@property (strong, nonatomic) IBOutlet UILabel *salesL;
@property (strong, nonatomic) IBOutlet UIImageView *salesV;
@property (strong, nonatomic) IBOutlet UIView *priceView;
@property (strong, nonatomic) IBOutlet UILabel *priceL;
@property (strong, nonatomic) IBOutlet UIImageView *priceV;
@property (strong, nonatomic) IBOutlet UITableView *maintableView;

@end
