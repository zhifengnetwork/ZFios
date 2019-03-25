//
//  ZFShoppingCartVC.h
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZFShoppingCartVC;
@protocol ZFShoppingCartVCDelegate <NSObject>
- (void)setEditing;
@end
/**
 购物车
 */
@interface ZFShoppingCartVC : UIViewController
@property (nonatomic, weak)id <ZFShoppingCartVCDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
