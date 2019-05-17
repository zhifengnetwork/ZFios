//
//  ZFMyWalletCollectionCell.h
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

/**
 首页CollectionViewCell
 */
@interface ZFMyWalletCollectionCell : UICollectionViewCell

//背景
@property (nonatomic, strong) NSString *backgroundName;
//标题
@property (nonatomic, strong) NSString *title;
//图标
@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, strong) NSString *number;

@end

NS_ASSUME_NONNULL_END
