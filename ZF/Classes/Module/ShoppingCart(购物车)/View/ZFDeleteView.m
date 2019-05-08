//
//  ZFDeleteView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/25.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFDeleteView.h"
#import "UIView+TYAlertView.h"
#import "http_shopping.h"
#import "SVProgressHUD.h"

@interface ZFDeleteView()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@property (nonatomic, strong)UIView *xLineView;
@property (nonatomic, strong)UIButton *cancelButton;
@property (nonatomic, strong)UIButton *deleteButton;
@property (nonatomic, strong)UIView *yLineView;

@end
@implementation ZFDeleteView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = RGBColorHex(0xffffff);
    self.layer.cornerRadius = 5;
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.xLineView];
    [self addSubview:self.cancelButton];
    [self addSubview:self.deleteButton];
    [self addSubview:self.yLineView];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(25);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(19);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_xLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).with.offset(25);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    [_yLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xLineView.mas_bottom);
        make.width.mas_equalTo(1);
        make.centerX.equalTo(self.mas_centerX);
        make.height.mas_equalTo(40);
    }];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.yLineView.mas_left);
        make.top.equalTo(self.xLineView.mas_bottom);
        make.height.mas_equalTo(40);
    }];
    [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yLineView.mas_right);
        make.right.equalTo(self);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.xLineView.mas_bottom);
    }];
}
- (UILabel *)titleLabel{
    if (_titleLabel ==nil) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        [_titleLabel setTextColor:RGBColorHex(0x1a1a1a)];
        [_titleLabel setText:@"删除"];
    }
    return _titleLabel;
}
- (UILabel *)detailLabel{
    if (_detailLabel == nil) {
        _detailLabel = [[UILabel alloc]init];
        [_detailLabel setFont:[UIFont systemFontOfSize:13]];
        [_detailLabel setTextColor:RGBColorHex(0x737373)];
        [_detailLabel setText:@"确定要删除选中的商品吗？"];
    }
    return _detailLabel;
}
- (UIView *)xLineView{
    if (_xLineView ==nil) {
        _xLineView = [[UIView alloc]init];
        _xLineView.backgroundColor = RGBColorHex(0x737373);
    }
    return _xLineView;
}
- (UIView *)yLineView{
    if (_yLineView ==nil) {
        _yLineView = [[UIView alloc]init];
        _yLineView.backgroundColor = RGBColorHex(0x737373);
    }
    return _yLineView;
}
- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        [_cancelButton setTitleColor:RGBColorHex(0x1a1a1a) forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}
- (UIButton *)deleteButton{
    if (_deleteButton == nil) {
        _deleteButton = [[UIButton alloc]init];
        [_deleteButton setTitleColor:RGBColorHex(0xff5454) forState:UIControlStateNormal];
        _deleteButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}
- (void)cancelClick{
    [self hideInWindow];
}
- (void)deleteClick{
    [http_shopping delcart:_ID success:^(id responseObject)
     {
         [SVProgressHUD showSuccessWithStatus:@"删除成功"];
         
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}
@end
