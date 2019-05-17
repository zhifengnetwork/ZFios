//
//  ZFMyWalletHeadView.h
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFOrdersModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 我的钱包headview
 */
@interface ZFMyWalletHeadView : UICollectionReusableView

@property (nonatomic, strong)ZFOrdersModel *orderModel;

@end

NS_ASSUME_NONNULL_END
