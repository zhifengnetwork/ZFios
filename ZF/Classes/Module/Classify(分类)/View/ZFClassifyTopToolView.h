//
//  ZFClassifyTopToolView.h
//  ZF
//
//  Created by apple on 22/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 分类顶部工具栏
 */
@interface ZFClassifyTopToolView : UIView

/** 搜索按钮点击点击 */
@property (nonatomic, copy) dispatch_block_t searchButtonClickBlock;

@end

NS_ASSUME_NONNULL_END
