//
//  EmptyDataTableCell.h
//  XV
//
//  Created by apple on 29/03/2019.
//  Copyright © 2019 XR. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol EmptyDataTableCellDelegate <NSObject>

@optional
/**
 *  空白页的tabcell按钮被点击
 *
 */
- (void)EmptyDataTableCellButtonDidClick:(NSIndexPath *)indexPath;

@end


/**
 空白页的tabcell
 */
@interface EmptyDataTableCell : UITableViewCell

@property (nonatomic, weak) id <EmptyDataTableCellDelegate> delegate;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, strong) UIColor *bgColor;

@property (nonatomic, strong) NSAttributedString *attributedTitle;


@end

NS_ASSUME_NONNULL_END
