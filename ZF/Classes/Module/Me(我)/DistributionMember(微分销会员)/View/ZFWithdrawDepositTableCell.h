//
//  ZFWithdrawDepositTableCell.h
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFWithdrawModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZFWithdrawDepositTableCellDelegate <NSObject>

//提现按钮被点击
- (void)ZFWithdrawDepositTableCellDidClick;

@end

/**
 提现cell
 */
@interface ZFWithdrawDepositTableCell : UICollectionViewCell

@property (nonatomic, strong)ZFWithdrawModel *withdraModel;

@property (nonatomic, weak) id<ZFWithdrawDepositTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
