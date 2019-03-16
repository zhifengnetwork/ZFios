//
//  ZFBaseBgviewTableCell.h
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFBaseBgviewTableCell : UITableViewCell

@property (nonatomic, strong) UIView *bgView;

- (void)setup;

@end

NS_ASSUME_NONNULL_END
