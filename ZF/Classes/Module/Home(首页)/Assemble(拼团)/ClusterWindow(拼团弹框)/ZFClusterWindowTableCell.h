//
//  ZFClusterWindowTableCell.h
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFAssembleModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 拼团cell
 */
@interface ZFClusterWindowTableCell : UITableViewCell

@property (nonatomic, assign)NSInteger team_id;//拼团活动id
@property (nonatomic, assign)NSInteger goodID;//商品id

@property (nonatomic, strong)ZFTeamFoundModel *foundModel;
@end

NS_ASSUME_NONNULL_END
