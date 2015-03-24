//
//  PanoramaImageView.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-11.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "PanoramaImageView.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "Const.h"
@implementation PanoramaImageView
@synthesize _scrollView;
@synthesize _imageView;
@synthesize _content_descL;
@synthesize _numofpageL;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        _frame = frame;
        [self initPlat];
    }
    return self;
}

- (void)initPlat{
    _scrollView = [[UIScrollView alloc] initWithFrame:_frame];
    
    _imageView = [[UIImageView alloc]initWithFrame:_frame];
    _imageView.contentMode = UIViewContentModeCenter;
    _bottom_View = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-90, self.frame.size.width, 100)];
    _bottom_View.backgroundColor = [UIColor blackColor];
    _bottom_View.backgroundColor = [_bottom_View.backgroundColor colorWithAlphaComponent:0.5];
    
    _content_descL = [[UITextView alloc]initWithFrame:CGRectMake(0, 20, _bottom_View.frame.size.width, 80)];
    _content_descL.editable = NO;
    _content_descL.textColor = [UIColor whiteColor];
    _content_descL.font = UIFontHiraginoSansGBW3(14);
    _content_descL.backgroundColor = [UIColor clearColor];
    
    _numofpageL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _bottom_View.frame.size.width, 20)];
    _numofpageL.textAlignment = NSTextAlignmentRight;
    _numofpageL.font = UIFontHiraginoSansGBW3(14);
    _numofpageL.textColor = [UIColor whiteColor];
    _numofpageL.backgroundColor = [UIColor clearColor];
    
    [_scrollView addSubview:_imageView];
    
    [self addSubview:_scrollView];
    
    [self addSubview:_bottom_View];
    
    [_bottom_View addSubview:_content_descL];
    [_bottom_View addSubview:_numofpageL];
}

- (void)loadImage:(id)obj{
    if([obj isKindOfClass:[UIImage class]]){
        UIImage * image = (UIImage *)obj;
        if(image.size.width>self.frame.size.width){
            float scale = image.size.width/self.frame.size.width;
            self._imageView.frame = CGRectMake(0, 0, self.frame.size.width, image.size.height/scale);
            if(self._imageView.frame.size.height>self.frame.size.height){
                self._scrollView.contentSize = CGSizeMake(self.frame.size.width, self._imageView.frame.size.height);
            }else{
                self._imageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
            }
            [_imageView setImage:image];
        }else{
            self._imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            self._imageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        }

        
    }else{
        NSLog(@"%@",obj);
        __block PanoramaImageView * SELF = self;
        [_imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:obj]] placeholderImage:[UIImage imageNamed:@"no_phote"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            NSLog(@"%@",image);
            if(image.size.width>SELF.frame.size.width){
                float scale = image.size.width/SELF.frame.size.width;
                SELF._imageView.frame = CGRectMake(0, 0, SELF.frame.size.width, image.size.height/scale);
                if(SELF._imageView.frame.size.height>SELF.frame.size.height){
                    SELF._scrollView.contentSize = CGSizeMake(SELF.frame.size.width, SELF._imageView.frame.size.height);
                }else{
                    SELF._imageView.center = CGPointMake(SELF.frame.size.width/2, SELF.frame.size.height/2);
                }
            }else{
                SELF._imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
                SELF._imageView.center = CGPointMake(SELF.frame.size.width/2, SELF.frame.size.height/2);
            }
            [UIView animateWithDuration:0.5 animations:^{
                [SELF._imageView setImage:image];
            }];
            
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            
        }];
    }
}

- (void)layoutViews{
    
}

@end
