//
//  ZFShoppingItem.h
//  ZF
//
//  Created by weiming zhang on 2019/3/14.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFShoppingItem : NSObject
@property (nonatomic, assign)NSInteger number;
@property (nonatomic, assign, getter=isSelected)BOOL selected;
@property (nonatomic, assign, readonly)double totalPrice;
@end
