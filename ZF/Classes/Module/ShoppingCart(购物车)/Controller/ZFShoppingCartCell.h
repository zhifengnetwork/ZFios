//
//  ZFShoppingCartCell.h
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFShoppingItem.h"
@class ZFShoppingCartCell;
@protocol ZFShoppingCartCellDelegate <NSObject>
@optional
//代理加减商品数量
- (void)increase: (ZFShoppingCartCell *)cell;
- (void)decrease: (ZFShoppingCartCell *)cell;
@end
@interface ZFShoppingCartCell : UITableViewCell
@property (assign, nonatomic)id <ZFShoppingCartCellDelegate>delegate;
@property (strong, nonatomic)ZFShoppingItem *model;
+ (instancetype)ShoppingCartCell;
@end
