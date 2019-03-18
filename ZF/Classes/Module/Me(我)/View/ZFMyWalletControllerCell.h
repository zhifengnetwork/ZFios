//
//  ZFMyWalletControllerCell.h
//  ZF
//
//  Created by admin on 2019/3/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionCell.h"

NS_ASSUME_NONNULL_BEGIN

/**
 我的钱包CollectionViewCell
 */
@interface ZFMyWalletControllerCell : BaseCollectionCell

//标题
@property (nonatomic, strong) NSString *title;
//图标
@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, strong) NSString *number;

@end

NS_ASSUME_NONNULL_END
