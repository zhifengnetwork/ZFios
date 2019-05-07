//
//  ZFCommodityEvaluationTableCell.h
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGoodCommentModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 商品评价cell
 */
@interface ZFCommodityEvaluationTableCell : UITableViewCell

@property (nonatomic, strong)ZFGoodCommentModel *commentModel;
@end

NS_ASSUME_NONNULL_END
