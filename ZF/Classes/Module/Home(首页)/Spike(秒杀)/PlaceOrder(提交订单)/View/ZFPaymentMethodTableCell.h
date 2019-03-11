//
//  ZFPaymentMethodTableCell.h
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFPaymentMethodTableCellDelegate <NSObject>

@optional
/**
 点击了勾选或不勾选
 */
- (void)ZFPaymentMethodTableCellDidClick:(NSString*)text indexPath:(NSIndexPath *)indexPath;

@end

/**
 支付方式cell
 */
@interface ZFPaymentMethodTableCell : UITableViewCell

@property (nonatomic, weak) id<ZFPaymentMethodTableCellDelegate> delegate;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, assign) BOOL isSelected;

@end

NS_ASSUME_NONNULL_END
