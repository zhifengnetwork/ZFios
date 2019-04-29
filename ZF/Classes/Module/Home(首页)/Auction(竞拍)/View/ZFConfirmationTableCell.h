//
//  ZFConfirmationTableCell.h
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFStartAuctionModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ETHAmountInvesTableCellDelegate <NSObject>

@optional

//正在输入中
-(void)ETHAmountInvesTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath;

- (void)ZFConfirmationTableCellDidClick:(NSInteger)number;

@end

/**
 确认出价cell
 */
@interface ZFConfirmationTableCell : UICollectionViewCell

@property (nonatomic, weak) id<ETHAmountInvesTableCellDelegate> delegate;

@property(nonatomic, strong) ZFStartAuctionModel *startAuctionModel;

@property(nonatomic, assign) NSInteger minValue;

-(NSString*)getAmountText;

@end

NS_ASSUME_NONNULL_END
