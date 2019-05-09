//
//  ZFMyOrderHeadTableCell.h
//  ZF
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFOrderModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 我的订单head cell
 */
@interface ZFMyOrderHeadTableCell : UITableViewCell

@property (nonatomic, strong)ZFOrderModel *orderModel;
//订单类型，默认0所有，1:待发货,2:待支付,3:待收货,4:待评价
//@property (nonatomic, assign)NSInteger type;
@end

NS_ASSUME_NONNULL_END
