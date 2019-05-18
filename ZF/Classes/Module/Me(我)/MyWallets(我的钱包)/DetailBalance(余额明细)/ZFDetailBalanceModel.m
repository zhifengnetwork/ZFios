//
//  ZFDetailBalanceModel.m
//  ZF
//
//  Created by admin on 2019/5/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailBalanceModel.h"

@implementation ZFDetailBalanceModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end

@implementation ZFDetailBalanceListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list":@"ZFDetailBalanceModel"
             };
}

@end

