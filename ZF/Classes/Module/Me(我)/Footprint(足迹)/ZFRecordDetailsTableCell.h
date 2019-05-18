//
//  ZFRecordDetailsTableCell.h
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "ZFGoodModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol ZFRecordDetailsTableCellDelegate <NSObject>

//去购买被点击
- (void)ZFRecordDetailsTableCellDidClick:(ZFGoodModel *)detailModel;

@end

/**
 记录商品详情cell
 */
@interface ZFRecordDetailsTableCell : BaseTableViewCell

@property (nonatomic, weak) id<ZFRecordDetailsTableCellDelegate> delegate;

@property (nonatomic, strong)ZFGoodModel *detailModel;

@end

NS_ASSUME_NONNULL_END
