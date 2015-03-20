//
//  ELRequestSingle.h
//  BaoJianIphone
//
//  Created by elongtian on 15-3-19.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ELRequestSingleCallBack) (id objc);

@interface ELRequestSingle : NSObject
+ (void)homeBannerRequest:(ELRequestSingleCallBack) block;
+ (void)homePlateRequest:(ELRequestSingleCallBack)block;


//走进宝健
+ (void)comeBaoJianBannerRequest:(ELRequestSingleCallBack) block;
+ (void)comeBjPlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid;
+ (void)articleDetailRequest:(ELRequestSingleCallBack) block withObject:(NSString *)optionid;
//企业特色
+ (void)featurePlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid;

+ (void)panoramicListRequest:(ELRequestSingleCallBack)block withPage:(NSInteger) page OptionId:(NSString *)optionid;
+ (void)panoramicDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid;
//健康管理
+ (void)productListBannerRequest:(ELRequestSingleCallBack) block;
+ (void)productPlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid;
+ (void)productListRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid Page:(NSInteger)page;
+ (void)productDetalBannerRequest:(ELRequestSingleCallBack) block withObject:(NSString *)optionid;
+ (void)productDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid;

+ (void)topicListRequest:(ELRequestSingleCallBack)block Page:(NSInteger)page;
+ (void)topicDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid;

+ (void)infoCenterPlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid;
+ (void)infoListRequest:(ELRequestSingleCallBack)block Page:(NSInteger)page Optionid:(NSString *)optionid;
+ (void)newsDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid;

+ (void)chapterListRequest:(ELRequestSingleCallBack)block Optionid:(NSString *)optionid;


@end
