//
//  ZFAssembleModel.h
//  ZF
//
//  Created by admin on 2019/4/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"
#import "ZFGoodCommentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFTeamFoundModel : NSObject
@property (nonatomic, assign)NSInteger found_id;
@property (nonatomic, assign)NSInteger found_time;
@property (nonatomic, assign)NSInteger found_end_time;
@property (nonatomic, assign)NSInteger user_id;
@property (nonatomic, copy)NSString* nickname;
@property (nonatomic, copy)NSString* head_pic;
@property (nonatomic, assign)NSInteger order_id;
@property (nonatomic, assign)NSInteger join;
@property (nonatomic, assign)NSInteger need;
@end
@interface ZFAssembleModel : NSObject

//拼团活动ID
@property (nonatomic, assign)NSInteger team_id;
//拼团活动名称
@property (nonatomic, copy)NSString *act_name;
//商品ID
@property (nonatomic, assign)NSInteger goods_id;
//商品名称
@property (nonatomic, copy)NSString* goods_name;
//拼团价格
@property (nonatomic, copy)NSString *group_price;
//开始时间
@property (nonatomic, copy)NSString *start_time;
//结束时间
@property (nonatomic, copy)NSString *end_time;
//已拼多少件
@property (nonatomic, copy)NSString *sales_sum;
//拼团人数：0默认不限制
@property (nonatomic, copy)NSString *group_number;
//购买数量：0默认不限制
@property (nonatomic, copy)NSString *purchase_qty;
//本店价
@property (nonatomic, copy)NSString *shop_price;
//市场价
@property (nonatomic, copy)NSString *market_price;
//商品上传原始图
@property (nonatomic, copy)NSString *original_img;
//评论数量
@property (nonatomic, assign)NSInteger comment_count;
//时间
@property (nonatomic, copy)NSString *date;
@property (nonatomic, copy)NSString *cluster_type;
@property (nonatomic, strong)ZFGoodCommentModel *commentinfo;
@property (nonatomic, strong)ZFGoodCommentModel *comment_fr;


@end

@interface ZFAssembleListModel : NSObject

@property (nonatomic, strong)ZFAssembleModel *info;

@property (nonatomic, assign)NSInteger team_found_num;
@property (nonatomic, assign)NSInteger collect;
@property (nonatomic, strong)NSMutableArray *team_found;
@property (nonatomic, strong)NSMutableArray *goodsImg;

@end

NS_ASSUME_NONNULL_END
