//
//  ZFClassificationTableCell.h
//  ZF
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 首页分类cell
 */
@interface ZFClassificationTableCell : UICollectionViewCell

//标题
@property (nonatomic, strong) NSString *title;
//图标
@property (nonatomic, strong) NSString *iconName;

@end

NS_ASSUME_NONNULL_END
