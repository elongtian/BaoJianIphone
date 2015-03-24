//
//  MobileFindBackViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "MobileFindBackViewController.h"
#import "MobileFindBack2ViewController.h"
@interface MobileFindBackViewController ()

@end

@implementation MobileFindBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"手机找回密码";
    [_sure addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchDown];
    [_getcode addTarget:self action:@selector(getCodeAction:) forControlEvents:UIControlEventTouchDown];
}

- (void)getCodeAction:(id)sender{
    [self.view endEditing:YES];
    [ELRequestSingle modifyPassWordGetCodeRequest:^(BOOL sucess, id objc) {
        if(sucess){
            
        }else{
            
        }
        [self.view makeToast:objc];
    } Mobile:_mobile.text];
}

- (void)sureAction:(UIButton *)sender{
    [self.view endEditing:YES];
    [ELRequestSingle modifyPassWordVolliateCodeRequest:^(BOOL sucess, id objc){
        if(sucess){
            MobileFindBack2ViewController * mobile2 = [[MobileFindBack2ViewController alloc]initWithNibName:@"MobileFindBack2ViewController" bundle:nil];
            mobile2.mobile = _mobile.text;
            [self.navigationController pushViewController:mobile2 animated:YES];
        }else{
            [self.view makeToast:objc];
        }
    } Mobile:_mobile.text Code:_code.text];
    
  
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
