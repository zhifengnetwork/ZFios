//
//  ZFFinishEvaluationVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFFinishEvaluationVC.h"

@interface ZFFinishEvaluationVC ()
@property (nonatomic, strong)UIButton *backButton;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *successLabel;
@property (nonatomic, strong)UIButton *homeButton;
@property (nonatomic, strong)UIButton *lookEvaluation;

@end

@implementation ZFFinishEvaluationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}
- (void)setup{
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.successLabel];
    [self.view addSubview:self.homeButton];
    [self.view addSubview:self.lookEvaluation];
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(50);
        make.left.equalTo(self.view).with.offset(30);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(133);
        make.left.equalTo(self.view).with.offset(118);
        make.width.height.mas_equalTo(38);
    }];
    
    [_successLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView.mas_right).with.offset(15);
        make.centerY.equalTo(self.imageView.mas_centerY);
    }];
    
    [_homeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset((LL_ScreenWidth-290)/2);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(135);
        make.height.mas_equalTo(40);
    }];
    
    [_lookEvaluation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-(LL_ScreenWidth-290)/2);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(135);
        make.height.mas_equalTo(40);
    }];
}

- (UIButton *)backButton{
    if (_backButton == nil) {
        _backButton = [[UIButton alloc]init];
        [_backButton setImage:[UIImage imageNamed:@"icon-left-arrows"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    }return _backButton;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"queding"];
    }return _imageView;
}

- (UILabel *)successLabel{
    if (_successLabel == nil) {
        _successLabel = [[UILabel alloc]init];
        _successLabel.font = [UIFont systemFontOfSize:22];
        _successLabel.textColor = [UIColor whiteColor];
        _successLabel.text = @"评价成功";
    }return _successLabel;
}

- (UIButton *)homeButton{
    if (_homeButton == nil) {
        _homeButton = [[UIButton alloc]init];
        _homeButton.layer.cornerRadius = 20;
        _homeButton.layer.borderWidth = 2;
        _homeButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _homeButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_homeButton setTitle:@"返回首页" forState:UIControlStateNormal];
    }return _homeButton;
}

- (UIButton *)lookEvaluation{
    if (_lookEvaluation == nil) {
        _lookEvaluation = [[UIButton alloc]init];
        _lookEvaluation.layer.cornerRadius = 20;
        _lookEvaluation.layer.borderWidth = 2;
        _lookEvaluation.layer.borderColor = [UIColor whiteColor].CGColor;
        _lookEvaluation.titleLabel.font = [UIFont systemFontOfSize:15];
        [_lookEvaluation setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_lookEvaluation setTitle:@"查看详情" forState:UIControlStateNormal];
    }return _lookEvaluation;
}



#pragma mark --方法
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
