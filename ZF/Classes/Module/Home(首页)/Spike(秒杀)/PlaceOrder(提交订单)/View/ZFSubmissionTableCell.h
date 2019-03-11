//
//  ZFSubmissionTableCell.h
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 提交订单cell
 */
@interface ZFSubmissionTableCell : UITableViewCell

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIButton *submissionButton;

@end

NS_ASSUME_NONNULL_END
