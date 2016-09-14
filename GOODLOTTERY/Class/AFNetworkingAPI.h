//
//  AFNetworkingAPI.h
//  GOODLOTTERY
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef void(^AFNetworkingSuccessBlock)(NSMutableDictionary *responseDic);
typedef void(^AFNetworkingFailureBlock)(NSError *error);

@interface AFNetworkingAPI : NSObject
{
    AFHTTPSessionManager *requestOperationManager;
    AFURLSessionManager * sessionManager;
}
@property(assign,nonatomic) NSTimeInterval timeoutInterval;
+(AFNetworkingAPI *)shareAFNetworking;
/**
 取消请求
 */
+(void)cancel;
-(void)cancel;

/************************ Instance method ************************/
/**
 GET Request
 */
#pragma mark-- GET Request
-(void)getHttp:(NSString *)url
       showHUD:(BOOL)isShow
    parameters:(NSMutableDictionary *)parameters
       success:(AFNetworkingSuccessBlock)success
       failure:(AFNetworkingFailureBlock)failure;

/**
 POST URL-Form-Encoded Request
 */
#pragma mark-- POST URL-Form-Encoded Request
-(void) postHttp:(NSString *)url
         showHUD:(BOOL)isShow
      parameters:(id)parameters
         success:(AFNetworkingSuccessBlock)success
         failure:(AFNetworkingFailureBlock)failure;


@end
