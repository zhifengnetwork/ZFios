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

@property (nonatomic, strong)ZFGoodModel *cartModel;

@property (nonatomic, assign)BOOL addCart;
@property (nonatomic, assign)BOOL isbuy;
@end

NS_ASSUME_NONNULL_END
