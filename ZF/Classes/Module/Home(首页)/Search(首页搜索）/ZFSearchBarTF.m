//
//  ZFSearchBarTF.m
//  ZF
//
//  Created by weiming zhang on 2019/3/30.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSearchBarTF.h"

@implementation ZFSearchBarTF

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.layer.cornerRadius = 5;
    self.backgroundColor = RGBColorHex(0xf2f2f2);
}
@end
