//
//  ZFMyColumnTableCell.h
//  ZF
//
//  Created by admin on 2019/3/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZFMyColumnTableCellDelegate <NSObject>

@optional

/**
 我的专栏headview被点击
 */
- (void)ZFMyColumnHeadViewDidClick;

/**
 我的专栏cell被点击
 */
- (void)ZFMyColumnTableCellDidClick:(NSIndexPath*)indexPath;

@end

/**
 我的专栏cell
 */
@interface ZFMyColumnTableCell : BaseTableViewCell

@property (nonatomic, weak) id<ZFMyColumnTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
