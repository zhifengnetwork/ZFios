//
//  ZFDetailsChoiceTableCell.h
//  ZF
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "ZFGoodModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol ZFDetailsChoiceTableCellDelegate <NSObject>

//去购买被点击
- (void)ZFDetailsChoiceTableCellDidClick:(ZFGoodModel *)detailModel;

@end

/**
 选中记录商品详情cell
 */
@interface ZFDetailsChoiceTableCell : BaseTableViewCell

@property (nonatomic, weak) id<ZFDetailsChoiceTableCellDelegate> delegate;

@property (nonatomic, strong)ZFGoodModel *detailModel;
- (void)selectionButtonDidClick;
@end

NS_ASSUME_NONNULL_END
