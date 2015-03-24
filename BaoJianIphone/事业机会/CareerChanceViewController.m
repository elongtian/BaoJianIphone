//
//  CareerChanceViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "CareerChanceViewController.h"
#import "CareerFinalViewController.h"
@interface CareerChanceViewController ()

@end

@implementation CareerChanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navbar.titleLabel.text = @"事业机会";
    self.bottom_logoV.hidden = NO;
    channelArray = [[NSMutableArray alloc]init];
    [self download];
    
    for(int i = 0;i<5;i++){
        UIView * v = (UIView *)[self.view viewWithTag:100+i];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [v addGestureRecognizer:tap];
    }
}
- (void)tapAction:(UITapGestureRecognizer *)tap{
    if([channelArray count]==0){
        [self.view makeToast:@"数据正在拉取中..."];
        return;
    }else{
        
    }
    NSInteger num = tap.view.tag-100;
    CareerFinalViewController * career = [[CareerFinalViewController alloc]initWithNibName:@"CareerFinalViewController" bundle:nil];
    BJObject * object = [channelArray objectAtIndex:num];
    career.titleName = object.modules_name;
    career.optionid = object.auto_id;
    [self.navigationController pushViewController:career animated:YES];
}

- (void)download{
    [ELRequestSingle careerPlateRequest:^(BOOL sucess, id objc) {
        [channelArray addObjectsFromArray:objc];
    } withObject:self.optionid];
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
