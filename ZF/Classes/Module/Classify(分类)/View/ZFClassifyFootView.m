//
//  ZFClassifyFootView.m
//  ZF
//
//  Created by apple on 29/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassifyFootView.h"

@interface ZFClassifyFootView()

@end

@implementation ZFClassifyFootView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = RGBColorHex(0xffffff);
    
}


@end
