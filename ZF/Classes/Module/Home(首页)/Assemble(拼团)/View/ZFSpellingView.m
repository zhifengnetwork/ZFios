//
//  ZFSpellingView.m
//  ZF
//
//  Created by weiming zhang on 2019/5/23.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpellingView.h"
#import "ZFSpellListCell.h"
@interface ZFSpellingView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *cancelButton;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UILabel *promptLabel;
@end
@implementation ZFSpellingView

static NSString *const ZFSpellingCellID = @"ZFSpellingCellID";
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
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self addSubview:lineView];
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
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(8);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(300);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).with.offset(11);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = RGBColor(51, 51, 51);
        _titleLabel.text =@"正在拼单";
    }return _titleLabel;
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        [_cancelButton setImage:[UIImage imageNamed:@"chacha"] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }return _cancelButton;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
        [_tableView registerClass:[ZFSpellListCell class] forCellReuseIdentifier:ZFSpellingCellID];
    }return _tableView;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:13];
        _promptLabel.textColor = RGBColor(102, 102, 102);
        _promptLabel.text = @"仅显示6个正在拼单的人";
    }return _promptLabel;
}

#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFSpellListCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFSpellingCellID forIndexPath:indexPath];
    return cell;
}

#pragma mark -- 方法
- (void)cancelClick{
    [[self currentViewController]dismissViewControllerAnimated:YES completion:nil];
}

- (UIViewController *)currentViewController{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}
@end
