//
//  ZFGoodCommentModel.h
//  ZF
//
//  Created by weiming zhang on 2019/5/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFDetailsPageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFGoodCommentModel : NSObject
//评论ID
@property (nonatomic, assign)NSInteger comment_id;
//商品ID
@property (nonatomic, assign)NSInteger goods_id;
//email邮箱
@property (nonatomic, copy)NSString *email;
//用户名
@property (nonatomic, copy)NSString *username;
//评论内容
@property (nonatomic, copy)NSString *content;
//添加时间
@property (nonatomic, assign)NSInteger add_time;
//ip地址
@property (nonatomic, copy)NSString *ip_address;
//是否显示
@property (nonatomic, assign)NSInteger is_show;
//父id
@property (nonatomic, assign)NSInteger parent_id;
//评论用户ID
@property (nonatomic, assign)NSInteger user_id;
//晒单图片
@property (nonatomic, copy)NSString *img;
//订单id
@property (nonatomic, assign)NSInteger order_id;
//物流评价等级
@property (nonatomic, assign)NSInteger deliver_rank;
//商品评价等级
@property (nonatomic, assign)NSInteger goods_rank;
//商家服务态度评价等级
@property (nonatomic, assign)NSInteger service_rank;
//被赞数
@property (nonatomic, assign)NSInteger zan_num;
//点赞用户id
@property (nonatomic, copy)NSString *zan_userid;
//是否匿名评价:0不是，1是
@property (nonatomic, assign)NSInteger is_anonymous;
//订单商品表ID
@property (nonatomic, assign)NSInteger rec_id;
//排序
@property (nonatomic, assign)NSInteger sort;
//用户头像
@property (nonatomic, copy)NSString *head_pic;
//回复评论信息
@property (nonatomic, strong)NSArray *reply;
//评论详细信息
@property (nonatomic, strong)NSArray *comment_fr;
//晒图数
@property (nonatomic, assign)NSInteger img_sum;
//好评数
@property (nonatomic, assign)NSInteger high_sum;
//好评率
@property (nonatomic, assign)NSInteger high_rate;
//中评数
@property (nonatomic, assign)NSInteger center_sum;
//中评率
@property (nonatomic, assign)NSInteger center_rate    ;
//差评数
@property (nonatomic, assign)NSInteger low_sum;
//差评率
@property (nonatomic, assign)NSInteger low_rate;
//评论总数
@property (nonatomic, assign)NSInteger total_sum;
@end

@interface ZFGoodCommentListModel : NSObject
//回复评论信息
@property (nonatomic, strong)NSMutableArray *commentlist;
//评论详细信息
@property (strong, nonatomic)ZFDetailsPageModel *comment_fr;
@end

NS_ASSUME_NONNULL_END
