//
//  ZFOrderDetailsTableCell.h
//  ZF
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFOrdersModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 订单详情cell
 */
@interface ZFOrderDetailsTableCell : UITableViewCell

@property (nonatomic, strong)ZFOrdersModel *orderModel;
@end

NS_ASSUME_NONNULL_END
