//
//  ProductListViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductListTableViewCell.h"
#import "ProductFinalViewController.h"
@interface ProductListViewController ()

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = self.titleName;
    [self initPlat];
    
    price_bool = NO;
    sale_bool = YES;
    sortindex = @"4";
    page = 1;
    keyword = nil;
    _code = nil;
    [self download];
}

- (void)download{
    [self.indicator startAnimatingActivit];
    [ELRequestSingle productListRequest:^(BOOL sucess, id objc) {
        if(sucess){
            [self loadData:objc];
            [self.indicator LoadSuccess];
        }else{
            [self.indicator LoadFailed];
        }
    } withObject:self.optionid Page:page Code:_code Keyword:keyword Sort:sortindex];
}
- (void)loadData:(id)objc{
    if(page == 1){
        [dataArray removeAllObjects];
    }else{
    
    }
    [dataArray addObjectsFromArray:(NSArray *)objc];
    [_maintableView reloadData];
}

- (void)initPlat{
    
    dataArray = [[NSMutableArray alloc]init];
    
    [_scannerBtn addTarget:self action:@selector(scannerAction:) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer * saletap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(saleAction:)];
    [_salesView addGestureRecognizer:saletap];
    
    UITapGestureRecognizer * pricetap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(priceAction:)];
    [_priceView addGestureRecognizer:pricetap];
    
    _coverControl = [[UIControl alloc]initWithFrame:CGRectMake(0, _searchField.frame.origin.y+_searchField.frame.size.height+5,SCREENWIDTH, SCREENHEIGHT-(_searchField.frame.origin.y+_searchField.frame.size.height+5))];
    _coverControl.backgroundColor = [UIColor blackColor];
    _coverControl.alpha = 0.4;
    _coverControl.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [_coverControl addGestureRecognizer:tap];
    [self.view addSubview:_coverControl];
     _icontextView = [[IconTextView alloc]initWithFrame:CGRectMake(0, 0, _searchField.frame.size.width, _searchField.frame.size.height)];
    __block ProductListViewController * Self = self;
    _icontextView.call_back = ^(IconTextView *view){
        
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            Self.searchtextfildRightConstraint.constant = 57;
        } completion:^(BOOL finished) {
            
            Self.coverControl.hidden = NO;
            
            Self.icontextView.hidden = YES;
            
            Self.searchField.placeholder = @"请输入商品名称";
            UIImageView *leftView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
            leftView.image=[UIImage imageNamed:@"pro_search_icon"];
            Self.searchField.leftView=leftView;
            //设置leftView的frame
            //     leftView.frame.width=40;
            //     leftView.frame.height=35;
            //设置leftViewMode
            Self.searchField.leftViewMode=UITextFieldViewModeAlways;
            //设置放大镜距离左边的间距，设置leftView的内容居中
            leftView.contentMode=UIViewContentModeCenter;
            
            [Self.searchField becomeFirstResponder];
        }];
        [Self.view setNeedsLayout]; //更新视图
        [Self.view layoutIfNeeded];
        
    };
    
    [_searchField addSubview:_icontextView];
    
    [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchDown];
    
    
    self.indicator = [[ActivityIndicator alloc]initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, SCREENHEIGHT-(_salesView.frame.size.height+_salesView.frame.origin.y)) LabelText:@"正在加载..." withdelegate:nil withType:ActivityIndicatorDefault andAction:nil];
    [self.view addSubview:self.indicator];
}


#pragma mark - UItableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ProductListTableViewCell"];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductListTableViewCell" owner:self options:nil] lastObject];
        cell.content_img.layer.borderColor = UIColorFromRGB(0xaeaeb0).CGColor;
        cell.content_img.layer.borderWidth = 1;
    }
    
    BJObject * object = [dataArray objectAtIndex:indexPath.row];
    [cell.content_img setImageWithURL:[NSURL URLWithString:object.content_img] placeholderImage:[UIImage imageNamed:@"no_phote"]];
    cell.content_name.text = object.content_name;
    cell.content_desc1.text = object.superiority;
    cell.content_desc2.text = object.effect;
    cell.content_price.text = [NSString stringWithFormat:@"建议零售价:%@",object.content_preprice];
    cell.price.text = [NSString stringWithFormat:@"优惠价:%@",object.content_price];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 122.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductFinalViewController * final = [[ProductFinalViewController alloc]initWithNibName:@"ProductFinalViewController" bundle:nil];
    final.optionid = [(BJObject *)[dataArray objectAtIndex:indexPath.row] auto_id];
    [self.navigationController pushViewController:final animated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    keyword = textField.text;
    _code = nil;
    [self download];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 隐藏浮层
- (void)tapAction:(UITapGestureRecognizer*)tap{
   
    [self cancelAction:nil];
}


#pragma mark - 取消
- (void)cancelAction:(UIButton *)sender{
    
     __block ProductListViewController * Self = self;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        Self.searchtextfildRightConstraint.constant = 10;
    } completion:^(BOOL finished) {
        
        Self.coverControl.hidden = YES;
        
        Self.icontextView.hidden = NO;
        
        Self.searchField.placeholder = nil;
        
        Self.searchField.leftView = nil;
        Self.searchField.leftViewMode=UITextFieldViewModeAlways;
        
        [Self.searchField resignFirstResponder];
    }];
    [Self.view setNeedsLayout]; //更新视图
    [Self.view layoutIfNeeded];
    
}


- (void)saleAction:(id)sender {
    
    if(sale_bool)
    {
        [_salesV setImage:[UIImage imageNamed:@"xl_select_up"]];
        _salesL.textColor = UIColorFromRGB(0xff602a);
        sale_bool = NO;
        sortindex = @"3";
    }
    else
    {
        [_salesV setImage:[UIImage imageNamed:@"xl_select_down"]];
        _salesL.textColor = UIColorFromRGB(0xff602a);
        sale_bool = YES;
        sortindex = @"4";
    }
    
//    if(index == 0)
//    {
//        
//    }
//    else
//    {
    
        [_priceV setImage:[UIImage imageNamed:@"jg_no_select_up"]];
        _priceL.textColor = [UIColor blackColor];
  //  }
    
//    sortindex = 0;
    price_bool = NO;
    [self download];
    
}

- (void)priceAction:(id)sender {
    if(price_bool)
    {
        [_priceV setImage:[UIImage imageNamed:@"jg_select_down"]];
        _priceL.textColor = UIColorFromRGB(0xff602a);
        price_bool = NO;
        sortindex = @"2";
    }
    else
    {
        [_priceV setImage:[UIImage imageNamed:@"jg_select_up"]];
        _priceL.textColor = UIColorFromRGB(0xff602a);
        price_bool = YES;
        sortindex = @"1";
    }
    
//    if(index == 1)
//    {
//        
//    }
//    else
//    {
        [_salesV setImage:[UIImage imageNamed:@"xl_no_select_down"]];
        _salesL.textColor = [UIColor blackColor];
   // }
    sale_bool = NO;
    
    [self download];
   }
#pragma mark - 扫描
- (void)scannerAction:(UIButton *)sender{
    QrCodeScanningController * qr = [[QrCodeScanningController alloc]initWithNibName:@"QrCodeScanningController" bundle:nil];
    qr.delegate = self;
    [self.navigationController pushViewController:qr animated:YES];
}
#pragma mark - 返回二维码的扫描结果
- (void)returnQrCode:(NSString *)code{
    keyword = nil;
    _code = code;
    [self download];
}

- (void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
