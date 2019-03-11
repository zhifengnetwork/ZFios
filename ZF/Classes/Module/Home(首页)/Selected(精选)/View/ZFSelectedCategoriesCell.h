//
//  ZFSelectedCategoriesCell.h
//  ZF
//
//  Created by apple on 2019/3/1.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 精选类别cell
 */
@interface ZFSelectedCategoriesCell : UICollectionViewCell

//标题
@property (nonatomic, strong) NSString *title;
//图标
@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, assign) BOOL showhLineView;

@end

NS_ASSUME_NONNULL_END
