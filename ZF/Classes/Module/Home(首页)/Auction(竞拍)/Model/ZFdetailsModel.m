//
//  ZFdetailsModel.m
//  ZF
//
//  Created by admin on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFdetailsModel.h"

@implementation ZFdetailsModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

@end

@implementation ZFBondUserModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

@end

@implementation ZFdetailListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"bondUser" : @"ZFBondUserModel"
             };
}

@end

