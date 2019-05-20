//
//  ZFWithRecordModel.m
//  ZF
//
//  Created by admin on 2019/5/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFWithRecordModel.h"

@implementation ZFWithRecordModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

//获取提现状态：-2删除作废 -1审核失败 0申请中 1审核通过 2付款成功 3付款失败
-(NSString*)getCashText
{
    if (self.status.intValue==1)
    {
        return @"审核通过";
    }
    else if (self.status.intValue==2)
    {
        return @"付款成功";
    }
    else if (self.status.intValue==3)
    {
        return @"付款失败";
    }
    else if (self.status.intValue==-1)
    {
        return @"审核失败";
    }
    else if (self.status.intValue==-2)
    {
        return @"删除作废";
    }
    return @"申请中";
}

@end

@implementation ZFWithRecordListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list":@"ZFWithRecordModel"
             };
}

@end

