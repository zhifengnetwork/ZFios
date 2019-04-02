//
//  ZFOrderModel.h
//  ZF
//
//  Created by admin on 2019/3/30.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFOrderModel : NSObject

//订单id
@property (nonatomic , assign) NSInteger order_id;
//商家id
@property (nonatomic , copy) NSString *seller_id;
//订单编号
@property (nonatomic , copy) NSString *order_sn;
//用户id
@property (nonatomic , assign) NSInteger user_id;
//订单状态
@property (nonatomic , assign) NSInteger order_status;
//发货状态
@property (nonatomic , assign) NSInteger shipping_status;
//支付状态
@property (nonatomic , assign) NSInteger pay_status;
//收货人
@property (nonatomic , copy) NSString *consignee;
//国家
@property (nonatomic , assign) NSInteger country;
//省份
@property (nonatomic , assign) NSInteger province;
//城市
@property (nonatomic , assign) NSInteger city;
//县区
@property (nonatomic , assign) NSInteger district;
//乡镇
@property (nonatomic , assign) NSInteger twon;
//地址
@property (nonatomic , copy) NSString *address;
//邮政编码
@property (nonatomic , copy) NSString *zipcode;
//手机
@property (nonatomic , copy) NSString *mobile;
//邮件
@property (nonatomic , copy) NSString *email;
//物流code
@property (nonatomic , copy) NSString *shipping_code;
//物流名称
@property (nonatomic , copy) NSString *shipping_name;
//支付code
@property (nonatomic , copy) NSString *pay_code;
//支付方式名称
@property (nonatomic , copy) NSString *pay_name;
//发票抬头
@property (nonatomic , copy) NSString *invoice_title;
//纳税人识别号
@property (nonatomic , copy) NSString *taxpayer;
//发票内容
@property (nonatomic , copy) NSString *invoice_desc;
//商品总价
@property (nonatomic , copy) NSString *goods_price;
//邮费
@property (nonatomic , copy) NSString *shipping_price;
//使用余额
@property (nonatomic , copy) NSString *user_money;
//优惠券抵扣
@property (nonatomic , copy) NSString *coupon_price;
//使用积分
@property (nonatomic , assign) NSInteger integral;
//使用积分抵多少钱
@property (nonatomic , copy) NSString *integral_money;
//签到免费领取抵扣金额
@property (nonatomic , copy) NSString *sign_price;
//应付款金额
@property (nonatomic , copy) NSString *order_amount;
//订单总价
@property (nonatomic , copy) NSString *total_amount;
//下单时间
@property (nonatomic , assign) NSInteger add_time;
//最后新发货时间
@property (nonatomic , assign) NSInteger shipping_time;
//收货确认时间
@property (nonatomic , assign) NSInteger confirm_time;
//支付时间
@property (nonatomic , assign) NSInteger pay_time;
//活动ID
@property (nonatomic , assign) NSInteger prom_id;
//订单类型：0普通订单4预售订单5虚拟订单6拼团订单
@property (nonatomic , assign) NSInteger prom_type;
//活动id
@property (nonatomic , assign) NSInteger order_prom_id;
//活动优惠金额
@property (nonatomic , copy) NSString *order_prom_amount;
//价格调整
@property (nonatomic , copy) NSString *discount;
//用户备注
@property (nonatomic , copy) NSString *user_note;
//管理员备注
@property (nonatomic , copy) NSString *admin_note;
//是否已分成0未分成1已分成
@property (nonatomic , assign) NSInteger is_distribut;
//订金
@property (nonatomic , copy) NSString *paid_money;
//自提点门店id
@property (nonatomic , assign) NSInteger shop_id;
//用户假删除标识,1:删除,0未删除
@property (nonatomic , assign) NSInteger deleted;

//商品名称
@property (nonatomic , copy) NSString *goods_name;
//规格对应的中文名字
@property (nonatomic , copy) NSString *spec_key_name;
//购买数量
@property (nonatomic , assign) NSInteger goods_num;
//商品上传原始图
@property (nonatomic , copy) NSString *original_img;

@end

NS_ASSUME_NONNULL_END
