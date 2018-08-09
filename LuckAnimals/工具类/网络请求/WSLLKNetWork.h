//
//  WSLLKNetWork.h
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,APIType)
{
    APITypeTest = 0,//测试
};

typedef NS_ENUM(NSInteger, RequestMethodType) {
    
    RequestTypePost = 0,
    RequestTypeGet
};

@interface WSLLKNetWork : NSObject

//类方法网络请求
+ (void)requestDataWithParam:(NSDictionary *)paramDic
                     apiType:(APIType)apiType
           requestMethodType:(RequestMethodType)requestMethodType
              succeededBlock:(void(^)(NSURLSessionDataTask * task,id responseObject))succeededBlock
                   failBlock:(void(^)(NSURLSessionDataTask * task,id responseObject))failBlock;

@end
