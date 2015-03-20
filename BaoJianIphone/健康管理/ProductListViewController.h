//
//  ProductListViewController.h
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "BaseViewController.h"
#import "ELTextField.h"
#import "IconTextView.h"
#import "Const.h"
#import "QrCodeScanningController.h"
@interface ProductListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,QrCodeScanningDelegate>{
    BOOL price_bool;
    BOOL sale_bool;
    NSInteger sortindex;
    NSMutableArray * dataArray;
    NSInteger page;
}
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
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *searchtextfildRightConstraint;
@property (retain, nonatomic) IconTextView * icontextView;

@property (retain, nonatomic) UIControl * coverControl;//点击搜索框显示的半透明浮层

@end
