//
//  PanoramaImageView.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-11.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "PanoramaImageView.h"
#import "AFNetworking.h"
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
    
    _content_descL = [[UILabel alloc]initWithFrame:CGRectZero];
    
    _numofpageL = [[UILabel alloc]initWithFrame:CGRectZero];
    
    [_scrollView addSubview:_imageView];
    
    [self addSubview:_scrollView];
    [self addSubview:_content_descL];
    [self addSubview:_numofpageL];
}

- (void)loadImage:(id)obj{
    if([obj isKindOfClass:[UIImage class]]){
    
    }else{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        NSURL *URL = [NSURL URLWithString:@"http://example.com/upload"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
        NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                NSLog(@"Success: %@ %@", response, responseObject);
            }
        }];
        [uploadTask resume];
    }
}

- (void)layoutViews{
    
}

@end
