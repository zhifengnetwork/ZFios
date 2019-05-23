//
//  ZFSpellListHeaderView.h
//  ZF
//
//  Created by weiming zhang on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//拼团详情   拼单headerview
@interface ZFSpellListHeaderView : UIView

@property (nonatomic, assign)NSInteger team_found_num;

@property (nonatomic, assign)NSInteger team_id;//拼团id
@property (nonatomic, assign)NSInteger goodID;//商品id
@property (nonatomic, strong)NSArray *teamArray;
@end

NS_ASSUME_NONNULL_END
