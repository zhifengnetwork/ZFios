//
//  ZFMyOrderCollectionCell.h
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionCell.h"


NS_ASSUME_NONNULL_BEGIN

@protocol ZFMyOrderCollectionCellDelegate <NSObject>

@optional

/**
 待付款被点击
 */
- (void)ZFMyOrderCollectionCellDidClick:(NSIndexPath*)indexPath;

@end


/**
 我的订单CollectionViewCell
 */
@interface ZFMyOrderCollectionCell : BaseCollectionCell

@property (nonatomic, weak) id<ZFMyOrderCollectionCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

//标题
@property (nonatomic, strong) NSString *title;
//图标
@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, assign) NSInteger number;

@end

NS_ASSUME_NONNULL_END
