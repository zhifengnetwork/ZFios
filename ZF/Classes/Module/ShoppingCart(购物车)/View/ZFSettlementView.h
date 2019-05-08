//
//  ZFShoppingCartView.h
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGoodModel.h"
@class ZFSettlementView;
@protocol ZFSettlementViewDelegate <NSObject>
@optional
- (void)reloadTableView;
//- (void)deleteClick;
//- (void)buyClick;
@end
@interface ZFSettlementView : UIView
+ (instancetype)CartView;
@property (nonatomic, weak)id <ZFSettlementViewDelegate>delegate;
- (void)setEditing;
- (void)setSettleMent;
@property (nonatomic, strong)ZFListModel *settleModel;

@property (nonatomic, strong)NSString *price;
//删除购物车id
@property (nonatomic, assign)NSArray* idArray;
@end
