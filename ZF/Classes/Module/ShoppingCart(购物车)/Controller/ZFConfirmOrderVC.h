//
//  ZFConfirmOrderVC.h
//  ZF
//
//  Created by weiming zhang on 2019/3/26.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFOrdersModel.h"
#import "ZFAddressModel.h"
@interface ZFConfirmOrderVC : UIViewController
//结算界面

//立即购买时需要action = 1;
//goods_id
//goods_num
//item_id
@property (nonatomic, getter=isBuy)BOOL isBuy;//直接购买
@property (nonatomic, getter=isSettle)BOOL isSettle;//购物车结算
@property (nonatomic, getter=isPin)BOOL isPin;//拼单和拼团单独购买
@property (nonatomic, strong)ZFAddressModel *pingModel;
@property (nonatomic, strong)ZFOrdersModel *ordersModel;

@end
