
//
//  ZFevaluationHeadTableCell.m
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFevaluationHeadTableCell.h"
#import "ZFEvaluationVC.h"

@interface ZFevaluationHeadTableCell()

@property (nonatomic, strong) UILabel* evaluateLabel;
@property (nonatomic, strong) UILabel* praiseLabel;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong)UIButton *jumpButton;

@end

@implementation ZFevaluationHeadTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.evaluateLabel];
    [self.contentView addSubview:self.praiseLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.jumpButton];
    [_evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_iconView.mas_left).offset(-10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_jumpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.praiseLabel.mas_left);
        make.right.equalTo(self.praiseLabel.mas_right);
        make.centerY.equalTo(self.contentView);
    }];
}

- (UILabel *)evaluateLabel {
    if (_evaluateLabel == nil) {
        _evaluateLabel = [[UILabel alloc] init];
        _evaluateLabel.textColor = RGBColorHex(0x000000);
        _evaluateLabel.font = [UIFont systemFontOfSize:13];
        _evaluateLabel.text = @"商品评价 (342100)";
    }
    return _evaluateLabel;
}

- (UILabel *)praiseLabel {
    if (_praiseLabel == nil) {
        _praiseLabel = [[UILabel alloc] init];
        _praiseLabel.textColor = RGBColorHex(0xE60B30);
        _praiseLabel.font = [UIFont systemFontOfSize:13];
        _praiseLabel.text = @"好评 98.7%";
    }
    return _praiseLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"arrow"];
    }
    return _iconView;
}

- (UIButton *)jumpButton{
    if (_jumpButton == nil) {
        _jumpButton = [[UIButton alloc]init];
        [_jumpButton addTarget:self action:@selector(jumpClick) forControlEvents:UIControlEventTouchUpInside];
    }return _jumpButton;
}

- (void)setTitleModel:(ZFGoodCommentModel *)titleModel{
    _titleModel = titleModel;
    _evaluateLabel.text = [NSString stringWithFormat:@"商品评价 (%ld)",(long)_titleModel.total_sum];
    _praiseLabel.text = [NSString stringWithFormat:@"好评 %ld",(long)_titleModel.high_rate];
    
}

#pragma mark -- 方法
- (void)jumpClick{
    ZFEvaluationVC *vc = [[ZFEvaluationVC alloc]init];
    [[self currentViewController].navigationController pushViewController:vc animated:YES];
}

//获取当前控制器
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
