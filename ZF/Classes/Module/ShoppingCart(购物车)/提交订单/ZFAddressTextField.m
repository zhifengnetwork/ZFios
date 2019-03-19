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
    self.layer.cornerRadius = 4;
    self.backgroundColor = RGBColorHex(0xf2f2f2);
    self.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];

    [self setValue:RGBColorHex(0xb3b3b3) forKeyPath:@"_placeholderLabel.textColor"];
    self.textColor = RGBColorHex(0x0f0f0f);
    [self becomeFirstResponder];
}
//控制placeholder的位置
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x+13, bounds.origin.y, bounds.size.width-13, bounds.size.height);
    return inset;
}

//控制显示文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x+13, bounds.origin.y, bounds.size.width-13, bounds.size.height);
    return inset;
}
//控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x+13, bounds.origin.y, bounds.size.width-13, bounds.size.height);
    return inset;
}
@end
