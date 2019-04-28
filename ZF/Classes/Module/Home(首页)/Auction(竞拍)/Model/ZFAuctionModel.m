//
//  ZFAuctionModel.m
//  ZF
//
//  Created by admin on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAuctionModel.h"

@implementation ZFAuctionModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

@end

@implementation ZFAuctionListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ZFAuctionModel"
             };
}

@end


