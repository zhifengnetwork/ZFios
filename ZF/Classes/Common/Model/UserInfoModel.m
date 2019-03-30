//
//  UserInfoModel.m
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UserInfoModel.h"
#import "MJExtension.h"

@implementation UserInfoListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"resultList" : @"UserInfoModel"
             };
}

@end


@implementation UserInfoModel

//userDefaults
#define kUserInfo @"UserInfo"

MJCodingImplementation


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID":@"id"
             };
}

//获取性别名称
-(NSString*)getSexText
{
    if (self.sex==1)
    {
        return @"男";
    }
    else if (self.sex==2)
    {
        return @"女";
    }
    
    return @"保密";
}


//获取用户信息
+(UserInfoModel*)readUserInfo
{
    // 解档
    NSData *userInfoData = [[NSUserDefaults standardUserDefaults] objectForKey:kUserInfo];
    UserInfoModel *userInfo = [NSKeyedUnarchiver unarchiveObjectWithData:userInfoData];
    
    return userInfo;
}


//保存用户信息
-(void)saveUserInfo
{
    // 归档
    NSData *userInfoData = [NSKeyedArchiver archivedDataWithRootObject:self];
    [[NSUserDefaults standardUserDefaults] setObject:userInfoData forKey:kUserInfo];
}

//删除用户信息
+(void)removeUserInfo
{
    // 归档
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kUserInfo];
}


@end
