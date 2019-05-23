//
//  ZFSpellListHeaderView.m
//  ZF
//
//  Created by weiming zhang on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpellListHeaderView.h"
#import "ZFClusterWindowView.h"
#import "TYShowAlertView.h"

@interface ZFSpellListHeaderView()
@property (nonatomic, strong)UILabel *spellListNumber;
@property (nonatomic, strong)UILabel *moreLabel;
@property (nonatomic, strong)UIImageView *moreImageView;
@property (nonatomic, strong)UIButton *moreButton;
@end
@implementation ZFSpellListHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self addSubview:self.spellListNumber];
    [self addSubview:self.moreLabel];
    [self addSubview:self.moreImageView];
    [self addSubview:self.moreButton];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColor(245, 245, 245);
    [self addSubview:lineView];
    [_spellListNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(25);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_moreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-25);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.moreImageView.mas_left).with.offset(-8);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.equalTo(self.moreLabel.mas_left);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}
- (UILabel *)spellListNumber{
    if (_spellListNumber == nil) {
        _spellListNumber = [[UILabel alloc]init];
        _spellListNumber.font = [UIFont systemFontOfSize:11];
        _spellListNumber.textColor = RGBColor(51, 51, 51);
        _spellListNumber.text = @"8人在拼单， 可直接参与";
    }return _spellListNumber;
}

- (UIImageView *)moreImageView{
    if (_moreImageView == nil) {
        _moreImageView = [[UIImageView alloc]init];
        _moreImageView.image = [UIImage imageNamed:@"youjiantou"];
    }return _moreImageView;
}

- (UILabel *)moreLabel{
    if (_moreLabel == nil) {
        _moreLabel = [[UILabel alloc]init];
        _moreLabel.font = [UIFont systemFontOfSize:10];
        _moreLabel.textColor = RGBColor(153, 153, 153);
        _moreLabel.text = @"查看更多";
    }return _moreLabel;
}

- (UIButton *)moreButton{
    if (_moreButton == nil) {
        _moreButton = [[UIButton alloc]init];
        [_moreButton addTarget:self action:@selector(spellListClick) forControlEvents:UIControlEventTouchUpInside];
    }return _moreButton;
}

- (void)setTeam_found_num:(NSInteger)team_found_num{
    _team_found_num = team_found_num;
    _spellListNumber.text = [NSString stringWithFormat:@"%ld人在拼单， 可直接参与",self.team_found_num];
}

- (void)spellListClick{
    //拼单页面
    ZFClusterWindowView* windowView = [[ZFClusterWindowView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    windowView.team_id = self.team_id;
    windowView.goodID = self.goodID;
    windowView.teamArray = self.teamArray;
    [TYShowAlertView showAlertViewWithView:windowView backgoundTapDismissEnable:YES];
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
