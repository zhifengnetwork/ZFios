//
//  ZFDistributionMemTableCell.h
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFDistributionMemTableCellDelegate <NSObject>

//1:升级会员 2:分润商品 3:推荐会员 4:账户管理
- (void)ZFDistributionMemTableCellDidClick:(int)type;

@end


@interface ZFDistributionMemTableCell : UICollectionViewCell

@property (nonatomic, weak) id<ZFDistributionMemTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
