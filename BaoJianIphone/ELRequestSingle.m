//
//  ELRequestSingle.m
//  BaoJianIphone
//
//  Created by elongtian on 15-3-19.
//  Copyright (c) 2015年 madongkai. All rights reserved.
//

#import "ELRequestSingle.h"
#import "ELHttpRequestOperation.h"
#import "BJObject.h"
#import "Const.h"
@implementation ELRequestSingle

/*
首页banner数据请求
 */
+ (void)homeBannerRequest:(ELRequestSingleCallBack) block{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,HomeBannerUrl];
//    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        if(block){
            block(YES,dataarray);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

/*
 首页、走进宝健、企业特色各模块optionid请求
 */
+ (void)homePlateRequest:(ELRequestSingleCallBack)block{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,@"&method=appSev&app_com=com_module&task=six_module"];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.modules_desc = OBJC([dic objectForKey:@"modules_desc"]);
            [dataArr addObject:object];
        }
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

/*
    走进宝健各模块optionid请求
 */
+ (void)comeBjPlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_module&task=module_more",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.modules_desc = OBJC([dic objectForKey:@"modules_desc"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}



/*
 走进宝健banner数据请求
 */
+ (void)comeBaoJianBannerRequest:(ELRequestSingleCallBack) block{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,@"&method=appSev&app_com=com_ad&task=come"];
    //    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        if(block){
            block(YES,dataarray);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
/*
    企业特色
 */
+ (void)featurePlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_module&task=module_more",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.modules_desc = OBJC([dic objectForKey:@"modules_desc"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

//走进宝健简介详情页
+ (void)articleDetailRequest:(ELRequestSingleCallBack) block withObject:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_article&task=module_article",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        BJObject * object = [[BJObject alloc]init];
        object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
        object.modules_desc = OBJC([dic objectForKey:@"modules_desc"]);
        object.content_body = OBJC([dic objectForKey:@"content_body"]);
        object.create_time = OBJC([dic objectForKey:@"create_time"]);
        if(block){
            block(YES,object);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

//走进宝特色详情页
+ (void)teSeDetailRequest:(ELRequestSingleCallBack) block withObject:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_article&task=module_article",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        BJObject * object = [[BJObject alloc]init];
        object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
        object.modules_desc = OBJC([dic objectForKey:@"modules_desc"]);
        object.content_body = OBJC([dic objectForKey:@"content_body"]);
        object.create_time = OBJC([dic objectForKey:@"create_time"]);
        if(block){
            block(YES,object);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
/*
    园区全景列表
 */
+ (void)panoramicListRequest:(ELRequestSingleCallBack)block withPage:(NSInteger) page OptionId:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_news&task=lists",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArray = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.content_name = OBJC([dic objectForKey:@"content_name"]);
            object.content_desc = OBJC([dic objectForKey:@"content_desc"]);
            object.content_body = OBJC([dic objectForKey:@"content_body"]);
            object.create_time = OBJC([dic objectForKey:@"create_time"]);
            object.content_img = OBJC([dic objectForKey:@"content_img"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            [dataArray addObject:object];
        }
        if(block){
            block(YES,dataArray);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}


+ (void)panoramicDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&auto_id=%@",HTTP,@"&method=appSev&app_com=com_news&task=view",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSArray * dataarray = [dic objectForKey:@"img"];
        NSMutableArray * dataArray = [[NSMutableArray alloc]init];
        for(NSDictionary * dict in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.content_name = OBJC([dict objectForKey:@"content_name"]);
            object.content_desc = OBJC([dict objectForKey:@"content_desc"]);
            object.content_body = OBJC([dict objectForKey:@"content_body"]);
            object.create_time = OBJC([dict objectForKey:@"create_time"]);
            object.content_img = OBJC([dict objectForKey:@"content_img"]);
            object.auto_id = OBJC([dict objectForKey:@"auto_id"]);
            [dataArray addObject:object];
        }
        if(block){
            block(YES,dataArray);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

/*
 产品banner数据请求
 */
+ (void)productListBannerRequest:(ELRequestSingleCallBack) block{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,@"&method=appSev&app_com=com_ad&task=app_shop_class_list"];
    //    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        if(block){
            block(YES,dataarray);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

/*
 产品频道optionid请求
 */
+ (void)productPlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,@"&method=appSev&app_com=com_shopproClass&task=app_shoppro_classes"];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_code = OBJC([dic objectForKey:@"auto_code"]);
            object.modules_desc = OBJC([dic objectForKey:@"modules_desc"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
/*
 产品列表请求
 */
+ (void)productListRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid Page:(NSInteger)page Code:(NSString *)code Keyword:(NSString *)keyword Sort:(NSString *)sort{
    NSString * url = [NSString stringWithFormat:@"%@%@&auto_code=%@",HTTP,@"&method=appSev&app_com=com_shopProduct&task=lists",optionid];
    url = code?[url stringByAppendingFormat:@"&bar_code=%@",code]:url;
    url = keyword?[url stringByAppendingFormat:@"&keywords=%@",[keyword stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]:url;
    url = sort?[url stringByAppendingFormat:@"&staus=%@",sort]:url;
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.content_name = OBJC([dic objectForKey:@"content_name"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.content_desc = OBJC([dic objectForKey:@"content_desc"]);
            object.content_img = OBJC([dic objectForKey:@"content_img"]);
            object.superiority = OBJC([dic objectForKey:@"superiority"]);
            object.effect = OBJC([dic objectForKey:@"effect"]);
            object.content_preprice = OBJC([dic objectForKey:@"content_preprice"]);
            object.content_price = OBJC([dic objectForKey:@"content_price"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*
    产品最终图集
 */
+ (void)productDetalBannerRequest:(ELRequestSingleCallBack) block withObject:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&auto_id=%@",HTTP,@"&method=appSev&app_com=com_shopPicture&task=app_lists",optionid];
    //    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        if(block){
            block(YES,dataarray);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
/*
    产品详情&method=appSev&app_com=com_shop&task=bview
 */
+ (void)productDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&auto_id=%@",HTTP,@"&method=appSev&app_com=com_shop&task=bview",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSDictionary * datadic = OBJC([dic objectForKey:@"data"]);
            BJObject * object = [[BJObject alloc]init];
            object.content_name = OBJC([datadic objectForKey:@"content_name"]);
            object.content_desc = OBJC([datadic objectForKey:@"content_desc"]);
            object.content_body = OBJC([datadic objectForKey:@"content_body"]);
            object.effect = OBJC([datadic objectForKey:@"effect"]);
            object.superiority = OBJC([datadic objectForKey:@"superiority"]);
            object.auto_id = OBJC([datadic objectForKey:@"auto_id"]);
            object.content_price = OBJC([datadic objectForKey:@"content_price"]);
            object.content_preprice = OBJC([datadic objectForKey:@"content_preprice"]);
        if(block){
            block(YES,object);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*
 话题列表
 */
+ (void)topicListRequest:(ELRequestSingleCallBack)block Page:(NSInteger)page{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,@"&method=appSev&app_com=com_comtopic&task=lists"];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dataDic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in OBJC([dataDic objectForKey:@"datalist"])){
            BJObject * object = [[BJObject alloc]init];
            object.content_name = OBJC([dic objectForKey:@"content_name"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.content_desc = OBJC([dic objectForKey:@"content_desc"]);
            object.content_img = OBJC([dic objectForKey:@"content_img"]);
            object.superiority = OBJC([dic objectForKey:@"superiority"]);
            object.effect = OBJC([dic objectForKey:@"effect"]);
            object.content_preprice = OBJC([dic objectForKey:@"content_preprice"]);
            object.content_price = OBJC([dic objectForKey:@"content_price"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


/*
 话题详情
 */
+ (void)topicDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&auto_id=%@",HTTP,@"&method=appSev&app_com=com_comtopic&task=view",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * datadic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        BJObject * object = [[BJObject alloc]init];
        object.content_name = OBJC([datadic objectForKey:@"content_name"]);
        object.content_desc = OBJC([datadic objectForKey:@"content_desc"]);
        object.content_body = OBJC([datadic objectForKey:@"content_body"]);
        object.create_time = OBJC([datadic objectForKey:@"create_time"]);
        object.content_img = OBJC([datadic objectForKey:@"content_img"]);
        object.auto_id = OBJC([datadic objectForKey:@"auto_id"]);
        if(block){
            block(YES,object);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*
 资讯中心新闻、刊物等optionid获取
 */
+ (void)infoCenterPlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_module&task=module_more",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_code = OBJC([dic objectForKey:@"auto_code"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.modules_desc = OBJC([dic objectForKey:@"modules_desc"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*
 资讯列表
 */
+ (void)infoListRequest:(ELRequestSingleCallBack)block Page:(NSInteger)page Optionid:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_news&task=lists",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * array = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in array){
            BJObject * object = [[BJObject alloc]init];
            object.content_name = OBJC([dic objectForKey:@"content_name"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.content_desc = OBJC([dic objectForKey:@"content_desc"]);
            object.content_body = OBJC([dic objectForKey:@"content_body"]);
            object.create_time = OBJC([dic objectForKey:@"create_time"]);
            object.content_img = OBJC([dic objectForKey:@"content_img"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*
 新闻最终
 */
+ (void)newsDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&auto_id=%@",HTTP,@"&method=appSev&app_com=com_news&task=zixun_view",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * datadic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        BJObject * object = [[BJObject alloc]init];
        object.content_name = OBJC([datadic objectForKey:@"content_name"]);
        object.content_desc = OBJC([datadic objectForKey:@"content_desc"]);
        object.content_body = OBJC([datadic objectForKey:@"content_body"]);
        object.create_time = OBJC([datadic objectForKey:@"create_time"]);
        object.auto_id = OBJC([datadic objectForKey:@"auto_id"]);
        if(block){
            block(YES,object);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
/*
 刊物章节列表
 */
+ (void)chapterListRequest:(ELRequestSingleCallBack)block Optionid:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_module&task=module_more",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * array = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in array){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.content_desc = OBJC([dic objectForKey:@"content_desc"]);
            object.content_img = OBJC([dic objectForKey:@"content_img"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*事业机会*/
//---------------------------------------------------

/*
 事业机会
 */
+ (void)careerPlateRequest:(ELRequestSingleCallBack)block withObject:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_module&task=module_more",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * dataarray = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in dataarray){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_code = OBJC([dic objectForKey:@"auto_code"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            object.modules_desc = OBJC([dic objectForKey:@"modules_desc"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

//事业机会最终
+ (void)careerDetailRequest:(ELRequestSingleCallBack)block withOptionId:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&optionid=%@",HTTP,@"&method=appSev&app_com=com_article&task=module_article",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * datadic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        BJObject * object = [[BJObject alloc]init];
        object.content_name = OBJC([datadic objectForKey:@"content_name"]);
        object.content_desc = OBJC([datadic objectForKey:@"content_desc"]);
        object.content_body = OBJC([datadic objectForKey:@"content_body"]);
        object.create_time = OBJC([datadic objectForKey:@"create_time"]);
        object.auto_id = OBJC([datadic objectForKey:@"auto_id"]);
        if(block){
            block(YES,object);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


/*会员中心*/
//省份请求--------------------------没有声明-------------------------------------
+ (void)provinceListRequest:(ELRequestSingleCallBack)block{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,@"&method=save&app_com=com_area&task=getProvince"];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * array = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in array){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_code = OBJC([dic objectForKey:@"auto_code"]);
           
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
+ (void)cityListRequest:(ELRequestSingleCallBack)block Optionid:(NSString *)optionid{
    NSString * url = [NSString stringWithFormat:@"%@%@&auto_code=%@",HTTP,@"&method=save&app_com=com_area&task=getCity",optionid];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * array = (NSArray *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        NSMutableArray * dataArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in array){
            BJObject * object = [[BJObject alloc]init];
            object.modules_name = OBJC([dic objectForKey:@"modules_name"]);
            object.auto_code = OBJC([dic objectForKey:@"auto_code"]);
            object.auto_id = OBJC([dic objectForKey:@"auto_id"]);
            [dataArr addObject:object];
        }
        
        if(block){
            block(YES,dataArr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


/*
 注册获取短信验证码
192.168.1.170/bj_app/app/index.php?com=com_appService&tel=15031503140
 */
+ (void)registerGetCodeRequest:(ELRequestSingleCallBack)block Mobile:(NSString *)mobile{
    NSString * url = [NSString stringWithFormat:@"%@%@&tel=%@",HTTP,@"&method=save&app_com=com_passport&task=send_tel_vcode",mobile];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        
        if(block){
            block(YES,[dic objectForKey:@"msg"]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
//注册协议
+ (void)registerprotocolRequest:(ELRequestSingleCallBack)block{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,@"&method=appSev&app_com=com_article&task=module_article&optionid=217"];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        BJObject * object = [[BJObject alloc]init];
        object.content_body = OBJC([dic objectForKey:@"content_body"]);
        if(block){
            block(YES,object);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
+ (void)keFuTelRequest:(ELRequestSingleCallBack)block{
    NSString * url = [NSString stringWithFormat:@"%@%@",HTTP,@"&method=save&app_com=com_passport&task=get_service_tel"];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        if(block){
            block(YES,[dic objectForKey:@"tel"]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

//登录
+ (void)loginRequest:(ELRequestSingleCallBack)block ID:(NSString *)userid AndPassWord:(NSString *)word{
    NSString * url = [NSString stringWithFormat:@"%@%@&ID=%@&PWD=%@",HTTP,@"&method=save&app_com=com_passport&task=app_doLogin",userid,word];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        
        if(block){
            block([[dic objectForKey:@"status"] boolValue],[dic objectForKey:@"msg"]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*
 手机找回密码获取手机验证码
 */
+ (void)modifyPassWordGetCodeRequest:(ELRequestSingleCallBack)block Mobile:(NSString *)mobile{
    NSString * url = [NSString stringWithFormat:@"%@%@&tel=%@",HTTP,@"&method=save&app_com=com_passport&task=send_edit_pwd_telvcode",mobile];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        
        if(block){
            block([[dic objectForKey:@"status"] boolValue],[dic objectForKey:@"msg"]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

/*
 验证手机验证码
 */
+ (void)modifyPassWordVolliateCodeRequest:(ELRequestSingleCallBack)block Mobile:(NSString *)mobile Code:(NSString *)code{
    NSString * url = [NSString stringWithFormat:@"%@%@&tel=%@&vcode=%@",HTTP,@"&method=save&app_com=com_passport&task=send_edit_pwd_telvcode",mobile,code];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        
        if(block){
            block([[dic objectForKey:@"status"] boolValue],[dic objectForKey:@"msg"]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
/*
    重设密码&method=save&app_com=com_passport&task=app_pwd_edit
 */
+ (void)modifyPassWordResetRequest:(ELRequestSingleCallBack)block Mobile:(NSString *)mobile Pwd:(NSString *)pwd{
    NSString * url = [NSString stringWithFormat:@"%@%@&tel=%@&vcode=%@",HTTP,@"&method=save&app_com=com_passport&task=app_pwd_edit",mobile,pwd];
    [[ELHttpRequestOperation sharedClient] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)([responseObject isEqual:[NSNull null]]?nil:responseObject);
        
        if(block){
            block([[dic objectForKey:@"status"] boolValue],[dic objectForKey:@"msg"]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


@end
