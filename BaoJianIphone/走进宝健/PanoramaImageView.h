//
//  PanoramaImageView.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-11.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanoramaImageView : UIView{
    CGRect _frame;
}
@property (retain, nonatomic) UIScrollView * _scrollView;
@property (retain, nonatomic) UIImageView * _imageView;
@property (retain, nonatomic) UITextView * _content_descL;
@property (retain, nonatomic) UILabel * _numofpageL;
@property (retain, nonatomic) UIView * bottom_View;
//@property (assign, nonatomic) CGFloat scale;//宽高比
- (void)loadImage:(id)obj;
@end
