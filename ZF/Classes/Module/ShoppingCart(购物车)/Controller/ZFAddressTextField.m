//
//  ZFAddressTextField.m
//  ZF
//
//  Created by weiming zhang on 2019/3/16.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFAddressTextField.h"

@implementation ZFAddressTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (void)setup{
    
}
//控制placeholder的位置
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    
}
//控制显示文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds{
    
}
//控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
}
@end
