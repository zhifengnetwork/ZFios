//
//  ZFMyOrderTableCell.h
//  ZF
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@protocol ZFMyOrderTableCellDelegate <NSObject>

@optional

/**
 我的订单headview被点击
 */
- (void)ZFMyOrderHeadViewDidClick;

/**
 我的订单cell被点击
 */
- (void)ZFMyOrderTableCellDidClick:(NSIndexPath*)indexPath;

@end


/**
 我的订单cell
 */
@interface ZFMyOrderTableCell : BaseTableViewCell

@property (nonatomic, weak) id<ZFMyOrderTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
