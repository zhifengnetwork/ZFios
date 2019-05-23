//
//  ZFSpellingView.m
//  ZF
//
//  Created by weiming zhang on 2019/5/23.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpellingView.h"
@interface ZFSpellingView()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *cancelButton;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UILabel *promptLabel;
@end
@implementation ZFSpellingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self addSubview:self.titleLabel];
    [self addSubview:self.cancelButton];
    [self addSubview:self.tableView];
    [self addSubview:self.promptLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self).with.offset(22);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self).with.offset(10);
    }];
    
    
}

@end
