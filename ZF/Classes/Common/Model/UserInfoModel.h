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


/**
 用户信息model
 */
@interface UserInfoModel : NSObject<NSCoding>

//用户ID
@property (nonatomic, copy) NSString *user_id;
//
@property (nonatomic, copy) NSString *token;
//手机号
@property (nonatomic, copy) NSString *mobile;
//用户头像
@property (nonatomic, copy) NSString *head_pic;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *user_money;
@property (nonatomic, copy) NSString *agent_user;
@property (nonatomic, copy) NSString *first_leader;
@property (nonatomic, copy) NSString *realname;
@property (nonatomic, copy) NSString *is_distribut;
@property (nonatomic, copy) NSString *is_agent;
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
