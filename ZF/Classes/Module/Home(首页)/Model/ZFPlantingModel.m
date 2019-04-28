//
//  ZFPlantingModel.m
//  ZF
//
//  Created by admin on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPlantingModel.h"

@implementation ZFPlantingModel

@end

@implementation ZFPlantingListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"adlist" : @"ZFADModel",
             @"notice" : @"ZFNoticeModel"
             };
}

@end

