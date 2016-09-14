//
//  AFNetworkingAPI.m
//  GOODLOTTERY
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AFNetworkingAPI.h"

@implementation AFNetworkingAPI

+(AFNetworkingAPI *)shareAFNetworking
{
    static dispatch_once_t once;
    static AFNetworkingAPI *share;
    dispatch_once(&once, ^{
        share = [[AFNetworkingAPI alloc] init];
    });
    
    return share;
}
-(id)init
{
    self = [super init];
    if (self != nil) {
        self.timeoutInterval = 0;//默认是不限时
    }
    return self;
}

#pragma mark - 取消请求
+(void)cancel{
    [[self shareAFNetworking] cancel];
}
-(void)cancel
{
    if (requestOperationManager) {
        [requestOperationManager.operationQueue cancelAllOperations];
        requestOperationManager = nil;
    }
    if (sessionManager) {
        [sessionManager.operationQueue cancelAllOperations];
        sessionManager = nil;
    }
//    if ([SVProgressHUD isVisible]) {
//        [SVProgressHUD dismiss];
//    }
}

#pragma mark - GET Request
-(void)getHttp:(NSString *)url
       showHUD:(BOOL)isShow
    parameters:(NSMutableDictionary *)parameters
       success:(AFNetworkingSuccessBlock)success
       failure:(AFNetworkingFailureBlock)failure
{
//    if (![self checkWith:isShow]) {
//        return ;
//    }
    requestOperationManager = [AFHTTPSessionManager manager];
    if (self.timeoutInterval != 0) {
        requestOperationManager.requestSerializer.timeoutInterval = self.timeoutInterval;
    }
    //申明返回的结果是json类型
    requestOperationManager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    requestOperationManager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    //    requestOperationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [requestOperationManager GET:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            if (success) {
                if (responseObject) {
                    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:responseObject
                                                                      options:NSJSONWritingPrettyPrinted error:nil];
                    
                    NSMutableDictionary *dataResponse = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
                    success(dataResponse);
                }
                else
                {
                    
                }
            }
        });
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error)
    {
        NSLog(@"Error: %@", error);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (failure) {
                failure(error);
//                [self dismissHUD];
            }
        });

    }];
    
    
    
}
#pragma mark - POST URL-Form-Encoded Request
-(void) postHttp:(NSString *)url
         showHUD:(BOOL)isShow
      parameters:(id)parameters
         success:(AFNetworkingSuccessBlock)success
         failure:(AFNetworkingFailureBlock)failure
{
    NSString* str = @"";
    NSMutableArray * paraArr = [[NSMutableArray alloc]init];
    for (NSString *key in parameters) {
        NSString * strsub =[NSString stringWithFormat:@"%@=%@",key,parameters[key]];
        [paraArr addObject:strsub];
    }
    str = [paraArr componentsJoinedByString:@"&"];
    NSLog(@"post请求：%@?%@",url,str);
//    if (![self checkWith:isShow]) {
//        return ;
//    }
    
    requestOperationManager = [AFHTTPSessionManager manager];
    if (self.timeoutInterval != 0) {
        requestOperationManager.requestSerializer.timeoutInterval = self.timeoutInterval;
    }
    
    //    requestOperationManager.responseSerializer
    //申明返回的结果是json类型
    requestOperationManager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    requestOperationManager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    //     requestOperationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //    [requestOperationManager.requestSerializer setValue:@"Basic " forHTTPHeaderField:@"Authorization"];
    //    [requestOperationManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [requestOperationManager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //     [requestOperationManager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //    requestOperationManager.requestSerializer.stringEncoding = [AFPropertyListRequestSerializer serializerWithFormat:NSPropertyListXMLFormat_v1_0 writeOptions:0];
    
    //    requestOperationManager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObject:@"POST"];
    
    //    if ([SingletonClass shareInstance].isTakeAuthKey) {
    //        NSString *authKey = [NSString stringWithFormat:@"Basic %@",[HSFunction getUserAuthKey]];
    //        [requestOperationManager.requestSerializer setValue:authKey forHTTPHeaderField:@"Authorization"];
    //
    //        [SingletonClass shareInstance].isTakeAuthKey = NO;
    //    }
    
    
    [requestOperationManager POST:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                NSData* jsonData =[NSJSONSerialization dataWithJSONObject:responseObject
                                                                  options:NSJSONWritingPrettyPrinted error:nil];
                NSMutableDictionary *dataResponse = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
                success(dataResponse);
            }
        });

    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (failure) {
                failure(error);
//                [self dismissHUD];
            }
        });

    }];
    
    }

@end
