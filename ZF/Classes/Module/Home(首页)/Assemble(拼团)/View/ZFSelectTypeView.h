//
//  ZFSelectTypeView.h
//  ZF
//
//  Created by weiming zhang on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGoodModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZFSelectTypeView : UIView

@property (nonatomic, assign)NSInteger goodID;
//购物车id
@property (nonatomic, assign)NSInteger cart_id;
//规格key
@property (nonatomic, copy)NSString *spec_key;

@property (nonatomic, assign)BOOL addCart;
@end

NS_ASSUME_NONNULL_END
