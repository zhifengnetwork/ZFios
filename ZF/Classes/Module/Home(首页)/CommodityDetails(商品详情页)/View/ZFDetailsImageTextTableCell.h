//
//  ZFDetailsImageTextTableCell.h
//  ZF
//
//  Created by apple on 28/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGoodModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 图文详情foot
 */
@interface ZFDetailsImageTextTableCell : UITableViewCell

@property (nonatomic, assign) BOOL isShowTopLine;
@property (nonatomic, assign) BOOL isShowBottomLine;

@property (nonatomic, strong)ZFGoodModel *attributemodel;


@end

NS_ASSUME_NONNULL_END
