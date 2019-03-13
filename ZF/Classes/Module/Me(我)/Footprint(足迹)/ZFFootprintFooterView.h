//
//  ZFFootprintFooterView.h
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZFFootprintFooterViewDelegate <NSObject>

//我的底部footview被点击 1:全选 2:删除
- (void)ZFFootprintFooterViewDidClick:(int)type;

@end

@interface ZFFootprintFooterView : UIView


@property (nonatomic, weak) id<ZFFootprintFooterViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
