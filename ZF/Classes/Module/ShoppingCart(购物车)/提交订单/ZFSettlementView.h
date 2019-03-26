//
//  ZFShoppingCartView.h
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class ZFSettlementView;
//@protocol ZFSettlementViewDelegate <NSObject>
//@optional
//- (void)deleteClick;
//- (void)buyClick;
//@end
@interface ZFSettlementView : UIView
+ (instancetype)CartView;
//@property (nonatomic, weak)id <ZFSettlementViewDelegate>delegate;
- (void)setEditing;
- (void)setPrice;
@end
