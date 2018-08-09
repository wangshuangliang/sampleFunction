//
//  WSLLKNetWork.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKNetWork.h"

@implementation WSLLKNetWork

//类方法网络请求
+ (void)requestDataWithParam:(NSDictionary *)paramDic
                     apiType:(APIType)apiType
           requestMethodType:(RequestMethodType)requestMethodType
              succeededBlock:(void(^)(NSURLSessionDataTask * task,id responseObject))succeededBlock
                   failBlock:(void(^)(NSURLSessionDataTask * task,id responseObject))failBlock
{
    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    [SVProgressHUD show];
    switch (internetStatus) {
        case ReachableViaWiFi:
        case ReachableViaWWAN:
        {
            //进行网络请求
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.requestSerializer.timeoutInterval = 5.f;
            manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
            switch (requestMethodType) {
                case RequestTypeGet:
                {
                    //GET请求
                    [manager GET:@"" parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        
                         succeededBlock(task,responseObject);
                        
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        
                        failBlock(task,error);
                        [SVProgressHUD showWithStatus:@"操作失败"];
                        [SVProgressHUD dismissWithDelay:0.6];
                        
                    }];
                }
                    break;
                case RequestTypePost:
                {
                    //POST请求
                    [manager POST:@"" parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        
                        succeededBlock(task,responseObject);
                        
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        
                        failBlock(task,error);
                        [SVProgressHUD showWithStatus:@"操作失败"];
                        [SVProgressHUD dismissWithDelay:0.6];
                        
                    }];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NotReachable:
        {
            [SVProgressHUD showErrorWithStatus:@"当前无网络"];
        }
            break;
        default:
        {
            [SVProgressHUD showErrorWithStatus:@"未知错误"];
        }
    }
}

//参数配置
+ (void)parameterConfigurationWithApi:(APIType)apiType
{
    switch (apiType) {
        case APITypeTest:
        {
            
        }
            break;
            
        default:
            break;
    }
}

@end
