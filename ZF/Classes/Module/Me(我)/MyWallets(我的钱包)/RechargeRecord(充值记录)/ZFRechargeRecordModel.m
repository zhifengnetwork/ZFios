//
//  ZFRechargeRecordModel.m
//  ZF
//
//  Created by admin on 2019/5/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFRechargeRecordModel.h"

@implementation ZFRechargeRecordModel

//获取充值状态0:待支付 1:充值成功 2:交易关闭
-(NSString*)getStatusText
{
    if (self.pay_status.intValue==1)
    {
        return @"充值成功";
    }
    else if (self.pay_status.intValue==2)
    {
        return @"交易关闭";
    }
    
    return @"待支付";
}

@end

@implementation ZFRechargeRecordListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list":@"ZFRechargeRecordModel"
             };
}

@end

