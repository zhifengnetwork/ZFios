//
//  http_address.m
//  ZF
//
//  Created by weiming zhang on 2019/4/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "http_address.h"

@implementation http_address

//地址管理列表
+ (void)address_list:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/user/address_list"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//用户删除地址接口
// ID   地址id
+ (void)del_address:(NSInteger)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",ID];
    [parameters setObject:str forKey:@"id"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/del_address"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 //修改地址
 //用户注册接口
 @param ID 地址id
 @param consignee 收货人
 @param mobile 手机号
 @param province 省份
 @param city 城市
 @param district 地区
 @param address 详细地址
 */
+ (void)edit_address:(NSInteger)ID consignee:(NSString*)consignee mobile:(NSString*)mobile province:(NSInteger)province city:(NSInteger)city district:(NSInteger)district address:(NSString*)address addressModel:(ZFAddressModel*)addressModel success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",ID];
    [parameters setObject:str forKey:@"id"];
    
    if (!kStringIsEmpty(consignee)) {
        [parameters setObject:consignee forKey:@"consignee"];
    }
    
    if (!kStringIsEmpty(mobile)) {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",province];
    [parameters setObject:str2 forKey:@"province"];
    
    NSString *str3 = [NSString stringWithFormat:@"%ld",city];
    [parameters setObject:str3 forKey:@"city"];
    
    NSString *str4 = [NSString stringWithFormat:@"%ld",district];
    [parameters setObject:str4 forKey:@"district"];
    
    if (!kStringIsEmpty(address)) {
        [parameters setObject:address forKey:@"address"];
    }
    
    if (!kStringIsEmpty(addressModel.label)) {
        [parameters setObject:addressModel.label forKey:@"label"];
    }
    
    NSString *str5 = [NSString stringWithFormat:@"%ld",addressModel.is_default];
    [parameters setObject:str5 forKey:@"is_default"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"/api/User/edit_address"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
