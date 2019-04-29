//
//  ZFdetailsModel.h
//  ZF
//
//  Created by admin on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 详情model
 */
@interface ZFdetailsModel : NSObject

//竞拍详情信息
@property (nonatomic, strong)NSArray* auction;
//竞拍活动ID
@property (nonatomic, copy)NSString *ID;
//商品ID
@property (nonatomic, copy)NSString *goods_id;
//活动名称
@property (nonatomic, copy)NSString *activity_name;
//商品名称
@property (nonatomic, copy)NSString *goods_name;
//起拍价
@property (nonatomic, copy)NSString *start_price;
//活动开始时间
@property (nonatomic, copy)NSString *start_time;
//结束时间
@property (nonatomic, copy)NSString *end_time;
//加价幅度
@property (nonatomic, copy)NSString *increase_price;
//状态，0关闭，1开启
@property (nonatomic, copy)NSString *auction_status;
//延时周期
@property (nonatomic, copy)NSString *delay_time;
//延时次数
@property (nonatomic, copy)NSString *delay_num;
//商品图片
@property (nonatomic, copy)NSString *original_img;

@end

//出价者信息
@interface ZFBondUserModel : BaseListModel

//出价用户id
@property (nonatomic, copy)NSString *user_id;
//价格
@property (nonatomic, copy)NSString *offer_price;
//出价时间
@property (nonatomic, copy)NSString *offer_time;
//用户名称
@property (nonatomic, copy)NSString *user_name;
//用户头像
@property (nonatomic, copy)NSString *head_pic;

@end


@interface ZFdetailListModel : BaseListModel

@property (nonatomic , strong) ZFdetailsModel * auction;

@property (nonatomic , strong) NSMutableArray * bondUser;

@end


NS_ASSUME_NONNULL_END
