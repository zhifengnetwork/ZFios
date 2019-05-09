//
//  ZFSelectTypeCell.h
//  ZF
//
//  Created by weiming zhang on 2019/5/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFGoodModel.h"
NS_ASSUME_NONNULL_BEGIN
@class ZFSelectTypeCell;
@protocol ZFSelectTypeCellDelegate <NSObject>

- (void)selectKeyID:(NSInteger)item_ID Cell:(ZFSelectTypeCell*)cell;

@end
@interface ZFSelectTypeCell : UITableViewCell

@property (nonatomic, assign)NSInteger item;
@property (nonatomic, strong)NSMutableArray *type;
@property (nonatomic, weak) id<ZFSelectTypeCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
