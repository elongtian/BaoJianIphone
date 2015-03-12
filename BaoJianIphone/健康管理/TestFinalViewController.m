//
//  TestFinalViewController.m
//  BaoJianIphone
//
//  Created by elongtian on 15-2-26.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "TestFinalViewController.h"

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
    
    NSString * str = @"测试题答案测试题答案测试题答案测试题答案测试题答案测试题答案";
    
//    UIFont * font = UIFontHiraginoSansGBW3(12);
//    
//    //算出测试题答案的长度和高度
//    CGSize size = [str getcontentsizeWithfont:font constrainedtosize:CGSizeMake(_mainContentView.frame.size.width, 100) linemode:NSLineBreakByCharWrapping];
    
    if (view == nil) {
        
        
        //复用scrollview上加的view
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _mainContentView.frame.size.width-20, _mainContentView.frame.size.height)];
        view.backgroundColor = [UIColor greenColor];
        UIImageView * imge = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        [imge setImage:[UIImage imageNamed:@"q_icon"]];
        [view addSubview:imge];
        
        UILabel * questionL = [[UILabel alloc]initWithFrame:CGRectMake(imge.frame.origin.x+imge.frame.size.width+10, imge.frame.origin.y+10, view.frame.size.width-(imge.frame.origin.x+imge.frame.size.width+10)-10-10, 100)];
        questionL.text = @"请选择您的身高：请选择您的身高：请选择您的身高：";
        questionL.numberOfLines = 0;
        
        CGSize qsize = [questionL.text getcontentsizeWithfont:questionL.font constrainedtosize:CGSizeMake(view.frame.size.width-(imge.frame.size.width+imge.frame.origin.x+10)-10, 100) linemode:NSLineBreakByCharWrapping];
        
        questionL.frame = CGRectMake(questionL.frame.origin.x, questionL.frame.origin.y, qsize.width, qsize.height);
        [view addSubview:questionL];
        
//--------------------------------------------------------------------------
        
        
        CGFloat y = imge.frame.origin.y+imge.frame.size.height>questionL.frame.origin.y+questionL.frame.size.height?imge.frame.origin.y+imge.frame.size.height:questionL.frame.origin.y+questionL.frame.size.height;
        
        UIScrollView * childScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, y, view.frame.size.width, view.frame.size.height-y)];
        
        [view addSubview:childScrollView];
        
        childScrollView.backgroundColor = [UIColor yellowColor];
        
        
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
            label.text = str;
            label.numberOfLines = 0;
             CGSize lsize = [str getcontentsizeWithfont:questionL.font constrainedtosize:CGSizeMake(childScrollView.frame.size.width-20-10*2, 100) linemode:NSLineBreakByCharWrapping];
            label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, lsize.width, lsize.height);
            
            [childScrollView addSubview:label];
            
            
            ly+=(label.frame.size.height>20?label.frame.size.height:20);
            ly+=5;
            
//            if(YES){
//                lx = label.frame.size.width+label.frame.origin.x;
//            }else{
//                lx = label.frame.size.width+label.frame.origin.x;
//            }
        }
       
        NSLog(@"%f",childScrollView.frame.size.height);
        
        childScrollView.contentSize = CGSizeMake(childScrollView.frame.size.width, 400);
        
    }
    
    
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
        }
        
        [self setSelected_btnIndex:current_index];
        mainScrollView.contentOffset = CGPointMake(mainScrollView.frame.size.width*(current_index-1), 0);
    }
    
}
- (void)nextAction:(UIButton *)sender{
    if(current_index == numbers){
        //提交
        
        return;
    }
    else
    {
       current_index++;
    }
    
    if(current_index == numbers){
        [_nextBtn setTitle:@"提交" forState:UIControlStateNormal];
        
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
