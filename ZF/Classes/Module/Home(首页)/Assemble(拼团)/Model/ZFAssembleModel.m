//
//  ZFAssembleModel.m
//  ZF
//
//  Created by admin on 2019/4/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAssembleModel.h"

@implementation ZFTeamFoundModel

@end
@implementation ZFAssembleModel

@end
@implementation ZFAssembleListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"goodsImg" : @"ZFGoodsImageModel",
             @"team_found" : @"ZFTeamFoundModel"
             };
}
@end




