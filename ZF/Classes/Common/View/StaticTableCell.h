//
//  StaticTableCell.h
//  LS
//
//  Created by apple on 2019/02/25.
//  Copyright © 2018 LS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 静态cell
 */
@interface StaticTableCell : UITableViewCell

//最左边的标题
@property (nonatomic, strong) UILabel * leftLabel;
//左2的标题
@property (nonatomic, strong) UILabel * left2Label;
//中间标题
@property (nonatomic, strong) UILabel * middleLabel;
//右标题
@property (nonatomic, strong) UILabel * rightLabel;
//右2标题
@property (nonatomic, strong) UILabel * right2Label;
//左边图标
@property (nonatomic, strong) UIImageView * leftIconView;
//右图图标
@property (nonatomic, strong) UIImageView * rightIconView;
//底线
@property (nonatomic, strong) UIView *bLineView;

@end

NS_ASSUME_NONNULL_END
