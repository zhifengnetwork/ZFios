//
//  ZFEvaluationVC.m
//  ZF
//
//  Created by weiming zhang on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFEvaluationVC.h"
#import "ZFBuyToolBarView.h"
#import "ZFEvaluationCell.h"

@interface ZFEvaluationVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIButton *allButton;
@property (nonatomic, strong)UIButton *praiseButton;
@property (nonatomic, strong)UIButton *mediumReviewButton;
@property (nonatomic, strong)UIButton *badReviewButton;
@property (nonatomic, strong)UIButton *baskInButton;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ZFEvaluationVC

static NSString *const ZFEvaluationCellID = @"ZFEvaluationCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户评价";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fenxiang"] style:UIBarButtonItemStylePlain target:self action:@selector(shareClick)];
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.allButton];
    [self.view addSubview:self.praiseButton];
    [self.view addSubview:self.mediumReviewButton];
    [self.view addSubview:self.badReviewButton];
    [self.view addSubview:self.baskInButton];
    [self.view addSubview:self.lineView];
    ZFBuyToolBarView *toolView = [[ZFBuyToolBarView alloc]init];
    [self.view addSubview:toolView];
    
    [self.view addSubview:self.tableView];
    
    [_allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.width.mas_equalTo(LL_ScreenWidth/5);
        make.height.mas_equalTo(60);
    }];
    
    [_praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.width.mas_equalTo(LL_ScreenWidth/5);
        make.height.mas_equalTo(60);
        make.left.equalTo(self.allButton.mas_right);
    }];
    
    [_mediumReviewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.width.mas_equalTo(LL_ScreenWidth/5);
        make.height.mas_equalTo(60);
        make.left.equalTo(self.praiseButton.mas_right);
    }];
    
    [_badReviewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.width.mas_equalTo(LL_ScreenWidth/5);
        make.height.mas_equalTo(60);
        make.left.equalTo(self.mediumReviewButton.mas_right);
    }];
    
    [_baskInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.width.mas_equalTo(LL_ScreenWidth/5);
        make.height.mas_equalTo(60);
        make.left.equalTo(self.badReviewButton.mas_right);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.allButton.mas_left);
        make.right.equalTo(self.allButton.mas_right);
        make.top.equalTo(self.allButton.mas_bottom);
        make.height.mas_equalTo(3);
    }];
    
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(toolView.mas_top);
    }];
    
}

- (UIButton *)allButton{
    if (_allButton == nil) {
        _allButton = [[UIButton alloc]init];
        _allButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_allButton setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
        [_allButton setTitleColor:RGBColor(232, 47, 92) forState:UIControlStateSelected];
        [_allButton setTitle:@"全部\n 60+" forState:UIControlStateNormal];
        _allButton.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [_allButton addTarget:self action:@selector(changeButton:) forControlEvents:UIControlEventTouchUpInside];
        _allButton.tag = 1;
        _allButton.selected = YES;
    }return _allButton;
}

- (UIButton *)praiseButton{
    if (_praiseButton == nil) {
        _praiseButton = [[UIButton alloc]init];
        _praiseButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_praiseButton setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
        [_praiseButton setTitleColor:RGBColor(232, 47, 92) forState:UIControlStateSelected];
        [_praiseButton setTitle:@"好评\n 60+" forState:UIControlStateNormal];
        _praiseButton.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [_praiseButton addTarget:self action:@selector(changeButton:) forControlEvents:UIControlEventTouchUpInside];
        _praiseButton.tag = 2;
    }return _praiseButton;
}

- (UIButton *)mediumReviewButton{
    if (_mediumReviewButton == nil) {
        _mediumReviewButton = [[UIButton alloc]init];
        _mediumReviewButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_mediumReviewButton setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
        [_mediumReviewButton setTitleColor:RGBColor(232, 47, 92) forState:UIControlStateSelected];
        [_mediumReviewButton setTitle:@"中评\n  0" forState:UIControlStateNormal];
        _mediumReviewButton.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [_mediumReviewButton addTarget:self action:@selector(changeButton:) forControlEvents:UIControlEventTouchUpInside];
        _mediumReviewButton.tag = 3;
    }return _mediumReviewButton;
}

- (UIButton *)badReviewButton{
    if (_badReviewButton == nil) {
        _badReviewButton = [[UIButton alloc]init];
        _badReviewButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_badReviewButton setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
        [_badReviewButton setTitleColor:RGBColor(232, 47, 92) forState:UIControlStateSelected];
        [_badReviewButton setTitle:@"差评\n  0" forState:UIControlStateNormal];
        _badReviewButton.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [_badReviewButton addTarget:self action:@selector(changeButton:) forControlEvents:UIControlEventTouchUpInside];
        _badReviewButton.tag = 4;
    }return _badReviewButton;
}

- (UIButton *)baskInButton{
    if (_baskInButton == nil) {
        _baskInButton = [[UIButton alloc]init];
        _baskInButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_baskInButton setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
        [_baskInButton setTitleColor:RGBColor(232, 47, 92) forState:UIControlStateSelected];
        [_baskInButton setTitle:@"差评\n  0" forState:UIControlStateNormal];
        _baskInButton.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [_baskInButton addTarget:self action:@selector(changeButton:) forControlEvents:UIControlEventTouchUpInside];
        _baskInButton.tag = 5;
    }return _baskInButton;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBColorHex(0xe82f5c);
    }return _lineView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 168;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFEvaluationCell class] forCellReuseIdentifier:ZFEvaluationCellID];
    }return _tableView;
}
#pragma mark --方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFEvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFEvaluationCellID forIndexPath:indexPath];
    return cell;
}

- (void)changeButton: (UIButton *)btn{
    if (btn.tag ==1) {
        _allButton.selected = YES;
        _praiseButton.selected = NO;
        _mediumReviewButton.selected = NO;
        _badReviewButton.selected = NO;
        _baskInButton.selected = NO;
    }else if (btn.tag == 2){
        _allButton.selected = NO;
        _praiseButton.selected = YES;
        _mediumReviewButton.selected = NO;
        _badReviewButton.selected = NO;
        _baskInButton.selected = NO;
    }else if (btn.tag == 3){
        _allButton.selected = NO;
        _praiseButton.selected = NO;
        _mediumReviewButton.selected = YES;
        _badReviewButton.selected = NO;
        _baskInButton.selected = NO;
    }else if (btn.tag == 4){
        _allButton.selected = NO;
        _praiseButton.selected = NO;
        _mediumReviewButton.selected = NO;
        _badReviewButton.selected = YES;
        _baskInButton.selected = NO;
    }else{
        _allButton.selected = NO;
        _praiseButton.selected = NO;
        _mediumReviewButton.selected = NO;
        _badReviewButton.selected = NO;
        _baskInButton.selected = YES;
    }
    
    [_lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn.mas_left);
        make.right.equalTo(btn.mas_right);
        make.top.equalTo(btn.mas_bottom);
        make.height.mas_equalTo(3);
    }];
    
}

- (void)shareClick{
    
}
@end
