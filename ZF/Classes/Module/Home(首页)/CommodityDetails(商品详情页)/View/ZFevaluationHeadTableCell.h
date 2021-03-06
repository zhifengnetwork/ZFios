//
//  ZFevaluationHeadTableCell.h
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGoodCommentModel.h"
#import "ZFDetailsPageModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 商品评价头部cell
 */
@interface ZFevaluationHeadTableCell : UITableViewCell

@property (nonatomic, assign)NSInteger goodsID;

@property (strong, nonatomic)ZFDetailsPageModel *comment_fr;

@end

NS_ASSUME_NONNULL_END
