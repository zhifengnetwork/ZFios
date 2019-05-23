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

/**
 选择规格view
 */
@interface ZFSelectTypeView : UIView

@property (nonatomic, assign)NSInteger cart_id;//购物车id
@property (nonatomic, assign)NSInteger team_id;//拼团活动id；
@property (nonatomic, assign)NSInteger goodID;
@property (nonatomic, assign)NSInteger found_id;//开团id

@property (nonatomic, strong)ZFGoodModel *cartModel;

@property (nonatomic, assign)BOOL addCart;//加入购物车
@property (nonatomic, assign)BOOL isbuy;//单独购买

@property (nonatomic, getter=isping)BOOL isPin;//拼团界面拼单
@property (nonatomic, getter=onlyBuy)BOOL onlyBuy;//拼团界面单独购买
@property (nonatomic, weak) id<ZFSelectTypeViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
