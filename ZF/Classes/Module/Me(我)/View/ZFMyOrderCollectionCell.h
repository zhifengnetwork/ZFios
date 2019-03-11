//
//  ZFMyOrderCollectionCell.h
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 我订单CollectionViewCell
 */
@interface ZFMyOrderCollectionCell : UICollectionViewCell

//标题
@property (nonatomic, strong) NSString *title;
//图标
@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, assign) NSInteger number;

@end

NS_ASSUME_NONNULL_END
