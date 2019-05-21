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
@class ZFSelectTypeView;
@protocol ZFSelectTypeViewDelegate <NSObject>

- (void)selectItemID: (NSString*)itemID;

@end
@interface ZFSelectTypeView : UIView

@property (nonatomic, assign)NSInteger cart_id;
@property (nonatomic, assign)NSInteger goodID;

@property (nonatomic, strong)ZFGoodModel *cartModel;

@property (nonatomic, assign)BOOL addCart;
@property (nonatomic, assign)BOOL isbuy;
@property (nonatomic, weak) id<ZFSelectTypeViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
