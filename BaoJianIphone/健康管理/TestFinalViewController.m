//
//  TestFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "TestFinalViewController.h"
#import "TestResultViewController.h"
@interface TestFinalViewController ()

@end

@implementation TestFinalViewController
@synthesize mainScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initPlat];
}

- (void)initPlat{
    numbers = 8;
    current_index = 1;
    [self CreateSerialNumber];
    
    mainScrollView = [[ReuseScrollView alloc]initWithFrame:CGRectMake(10, _testicon.frame.origin.y+_testicon.frame.size.height, _mainContentView.frame.size.width-20, _forwardBtn.frame.origin.y-30-(_testicon.frame.origin.y+_testicon.frame.size.height))];
    mainScrollView.scrollEnabled = NO;
    mainScrollView.isobserver = YES;
    mainScrollView.reuseDelegate = self;
    mainScrollView.delegate = self;
    mainScrollView.backgroundColor = [UIColor redColor];
    [_mainContentView addSubview:mainScrollView];
    
    [_forwardBtn addTarget:self action:@selector(forwardAction:) forControlEvents:UIControlEventTouchDown];
    [_nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchDown];
    
    answers = [[NSMutableArray alloc]init];
    for(int i = 0;i<numbers;i++){
        NSArray * arr = [[NSArray alloc]initWithObjects:@"测试A",@"测试B",@"测试C",@"测试D",@"测试E测试E测试E测试E测试E测试E测试E测试E", nil];
        [answers addObject:arr];
    }
    
    questions = [[NSMutableArray alloc]init];
    for(int i = 0;i<numbers;i++){
        
        NSString * str = [NSString stringWithFormat:@"这是一个测试题%d",i];
        [questions addObject:str];
    }
}



- (void)CreateSerialNumber{
    
    CGFloat width = 20;
    CGFloat distance = (SCREENWIDTH-20*2-15*2)/((numbers-1)*1.0);
    for(NSInteger i = 0;i<numbers;i++){
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 5, width, width);
        btn.center = CGPointMake(15+(i%numbers)*distance, btn.center.y);
        btn.titleLabel.font = UIFontHiraginoSansGBW6(13);
        [btn setTitleColor:UIColorFromRGB(0xbfbfbf) forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%ld",(long)i+1] forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 0);
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.tag = 100+i+1;
        [_topSelectView addSubview:btn];
    }
    
    _selected_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _selected_btn.frame = CGRectMake(0, 0, 21, 30);
    _selected_btn.titleLabel.font = UIFontHiraginoSansGBW6(13);
    _selected_btn.titleEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0);
    [_selected_btn setBackgroundImage:[UIImage imageNamed:@"test_select_bg"] forState:UIControlStateNormal];
    [_topSelectView addSubview:_selected_btn];
    
    [self setSelected_btnIndex:current_index];
}

- (void)setSelected_btnIndex:(NSInteger)index{
    UIButton * btn = (UIButton *)[_topSelectView viewWithTag:100+index];
    
    [UIView animateWithDuration:0.3 animations:^{
        _selected_btn.center = CGPointMake(btn.center.x, _selected_btn.center.y);
        [_selected_btn setTitle:[NSString stringWithFormat:@"%ld",(long)index] forState:UIControlStateNormal];
    }];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [mainScrollView loadView];
    
    int currentPage = floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) /  scrollView.frame.size.width) + 1;
    //    [self.pageControl setCurrentPage:currentPage % self.pageControl.numberOfPages];
    
}

#pragma mark-
#pragma mark-ReuseScrollView代理方法
- (NSInteger)numberOfViewInReuseScrollView:(ReuseScrollView *)reusrScroll{
    return numbers;
}

- (UIView *)reuseScrollView:(ReuseScrollView *)reusrScroll viewForLocationAtPage:(NSInteger)page{
    
    UIView *view = [reusrScroll getReusableView];
    
//    NSString * str = @"测试题答案测试题答案测试题答案测试题答案测试题答案测试题答案";
    
//    UIFont * font = UIFontHiraginoSansGBW3(12);
//    
//    //算出测试题答案的长度和高度
//    CGSize size = [str getcontentsizeWithfont:font constrainedtosize:CGSizeMake(_mainContentView.frame.size.width, 100) linemode:NSLineBreakByCharWrapping];
    
    if (view == nil) {
        //复用scrollview上加的view
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainScrollView.frame.size.width, mainScrollView.frame.size.height)];
        view.backgroundColor = [UIColor greenColor];
        UIImageView * imge = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        imge.tag = 1000;
        [imge setImage:[UIImage imageNamed:@"q_icon"]];
        [view addSubview:imge];
        
        UILabel * questionL = [[UILabel alloc]initWithFrame:CGRectMake(imge.frame.origin.x+imge.frame.size.width+10, imge.frame.origin.y+10, view.frame.size.width-(imge.frame.origin.x+imge.frame.size.width+10)-10-10, 100)];
        questionL.text = @"请选择您的身高：请选择您的身高：请选择您的身高：";
        questionL.numberOfLines = 0;
        questionL.tag = 1001;
        [view addSubview:questionL];
        
//--------------------------------------------------------------------------
        
        
        UIScrollView * childScrollView = [[UIScrollView alloc] init];
        childScrollView.tag = 1002;
        childScrollView.backgroundColor = [UIColor yellowColor];
        [view addSubview:childScrollView];
        
        CGFloat lx = 0;
        CGFloat ly = 0;
        for(int i = 0;i<5;i++){
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(imge.frame.origin.x, ly+10, 20, 20);
            [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor greenColor]];
            btn.tag = 100+i;
            [childScrollView addSubview:btn];
            

            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(btn.frame.size.width+btn.frame.origin.x+5, btn.frame.origin.y, 20, 20)];
            label.tag = 200+i;
            label.numberOfLines = 0;
            [childScrollView addSubview:label];

        }
    }
    
    
    UIImageView * imgeV = (UIImageView *)[view viewWithTag:1000];
    UILabel * question = (UILabel *)[view viewWithTag:1001];
    UIScrollView * ScrollView = (UIScrollView *)[view viewWithTag:1002];
    
    question.text = [questions objectAtIndex:current_index-1];
    CGSize qsize = [question.text getcontentsizeWithfont:question.font constrainedtosize:CGSizeMake(view.frame.size.width-(imgeV.frame.size.width+imgeV.frame.origin.x+10)-10, 100) linemode:NSLineBreakByCharWrapping];
    question.frame = CGRectMake(question.frame.origin.x, question.frame.origin.y, qsize.width, qsize.height);
    
    
    CGFloat y = imgeV.frame.origin.y+imgeV.frame.size.height>question.frame.origin.y+question.frame.size.height?imgeV.frame.origin.y+imgeV.frame.size.height:question.frame.origin.y+question.frame.size.height;
    
    ScrollView.frame = CGRectMake(10, y, view.frame.size.width - 20, view.frame.size.height - y);
    
    
    CGFloat lx = 0;
    CGFloat ly = 0;
    for(int i = 0;i<5;i++){
        UIButton * btn = (UIButton *)[ScrollView viewWithTag:100+i];
        UILabel * label = (UILabel *)[ScrollView viewWithTag:200+i];
        
        btn.frame = CGRectMake(imgeV.frame.origin.x, ly+10, 20, 20);
        
        label.text = [[answers objectAtIndex:current_index-1] objectAtIndex:i];
        CGSize lsize = [label.text getcontentsizeWithfont:label.font constrainedtosize:CGSizeMake(ScrollView.frame.size.width-20-10*2, 100) linemode:NSLineBreakByCharWrapping];
        label.frame = CGRectMake(btn.frame.size.width+btn.frame.origin.x+5, btn.frame.origin.y, lsize.width, lsize.height);
        
        ly += (label.frame.size.height > 20 ? label.frame.size.height : 20);
        ly += 5;
    }
    ScrollView.contentSize = CGSizeMake(ScrollView.frame.size.width, ly+10);
    
    return view;
}


- (void)forwardAction:(UIButton *)sender{
    
    current_index--;
    if(current_index<1)
    {
        current_index = 1;
        return;
    }
    else
    {
        if(current_index != numbers){
            [_nextBtn setTitle:@"下一题" forState:UIControlStateNormal];
            [_nextBtn setBackgroundImage:[UIImage imageNamed:@"next_btn_bg"] forState:UIControlStateNormal];
        }
        
        [self setSelected_btnIndex:current_index];
        mainScrollView.contentOffset = CGPointMake(mainScrollView.frame.size.width*(current_index-1), 0);
    }
    
}
- (void)nextAction:(UIButton *)sender{
    if(current_index == numbers){
        //提交
        TestResultViewController * result = [[TestResultViewController alloc]initWithNibName:@"TestResultViewController" bundle:nil];
        [self.navigationController pushViewController:result animated:YES];
        return;
    }
    else
    {
       current_index++;
    }
    
    if(current_index == numbers){
        [_nextBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"test_commit_btn_bg"] forState:UIControlStateNormal];
    }
    [self setSelected_btnIndex:current_index];
    
    mainScrollView.contentOffset = CGPointMake(mainScrollView.frame.size.width*(current_index-1), 0);
    
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
