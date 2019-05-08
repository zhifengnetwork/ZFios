//
//  ZFShoppingCartCell.h
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGoodModel.h"
@class ZFShoppingCartCell;
@protocol ZFShoppingCartCellDelegate <NSObject>
@optional
//代理商品数量
- (void)changeGoodsNum:(NSInteger)number Cell:(ZFShoppingCartCell *)cell;
//代理选中取消
- (void)selectGood:(NSString*)isSelected goods_id:(NSInteger)goods_id;
@end
@interface ZFShoppingCartCell : UITableViewCell
@property (weak, nonatomic)id <ZFShoppingCartCellDelegate>delegate;
@property (strong, nonatomic)ZFGoodModel *model;

@end
