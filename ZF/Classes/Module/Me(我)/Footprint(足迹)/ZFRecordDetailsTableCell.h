//
//  ZFRecordDetailsTableCell.h
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "ZFAssembleModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 记录商品详情cell
 */
@interface ZFRecordDetailsTableCell : BaseTableViewCell

@property (nonatomic, strong)ZFAssembleModel *detailModel;
@end

NS_ASSUME_NONNULL_END
