//
//  UserInfoModel.h
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

/**
 用户列表list model
 */
@interface UserInfoListModel : BaseListModel


@end



@interface MemberModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *vip_expires;
@property (nonatomic, copy) NSString *headimg;
@property (nonatomic, copy) NSString *balance;
@property (nonatomic, copy) NSString *points;

@end


/**
 用户信息model
 */
@interface UserInfoModel : NSObject<NSCoding>

//用户ID
@property (nonatomic, copy) NSString *ID;
//
@property (nonatomic, copy) NSString *token;
//
@property (nonatomic, strong) MemberModel *member;
//手机号
@property (nonatomic, copy) NSString *phone;
//用户头像
@property (nonatomic, copy) NSString *head_url;
//省
@property (nonatomic, copy) NSString *province;
//市
@property (nonatomic, copy) NSString *city;
//区
@property (nonatomic, copy) NSString *district;
//性别(1代表男 2代表女 0代表保密)
@property (nonatomic, assign) NSInteger sex;


//获取性别名称
-(NSString*)getSexText;

//获取用户信息(仅用于获取当前登录用户)
+(UserInfoModel*)readUserInfo;

//保存用户信息(仅用于当前登录用户)
-(void)saveUserInfo;

//删除用户信息
+(void)removeUserInfo;

@end
