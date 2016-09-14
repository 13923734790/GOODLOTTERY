//
//  Singleton.h
//  GOODLOTTERY
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#define Share(Datatool)       +(instancetype)Share##Datatool;
#define SingletonM(ZFDataTool)\
static id instance = nil;\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t once;\
dispatch_once(&once, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}\
-(instancetype)init\
{\
static dispatch_once_t once;\
dispatch_once(&once, ^{\
instance = [super init];\
});\
return instance;\
}\
+(instancetype)Share##ZFDatatool\
{\
return [[ZFDataTool alloc]init];\
}
