//
//  ZFTeamListCell.h
//  ZF
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFDetailDistModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFTeamListCell : UITableViewCell

/**
 团队列表cell
 */
@property (nonatomic, strong)ZFDetailDistModel *orderModel;
@end

NS_ASSUME_NONNULL_END
