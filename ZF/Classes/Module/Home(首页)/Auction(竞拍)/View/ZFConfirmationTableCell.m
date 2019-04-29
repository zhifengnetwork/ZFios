//
//  ZFConfirmationTableCell.m
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFConfirmationTableCell.h"
#import "PPNumberButton.h"

@interface ZFConfirmationTableCell()<PPNumberButtonDelegate>

@property (nonatomic, strong) PPNumberButton* numberButton;
@property (nonatomic, strong) UIButton *confirButton;

@end

@implementation ZFConfirmationTableCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.numberButton];
    [self.contentView addSubview:self.confirButton];
    
    [_numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(20);
    }];
    
    [_confirButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(95);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xBBBBBB);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.top.equalTo(self->_confirButton.mas_bottom).offset(5);
         make.height.mas_equalTo(0.5f);
     }];
    
}


- (void)setStartAuctionModel:(ZFStartAuctionModel *)startAuctionModel
{
    _startAuctionModel = startAuctionModel;
    
}

- (void)confirButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFConfirmationTableCellDidClick)])
    {
        [self.delegate ZFConfirmationTableCellDidClick];
    }
}

-(PPNumberButton* )numberButton
{
    if (_numberButton==nil)
    {
        _numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(0, 0, 110, 30)];
        // 开启抖动动画
        _numberButton.shakeAnimation = YES;
        _numberButton.currentNumber = 0;
        // 设置最小值
        _numberButton.minValue = 0;
        // 设置最大值
        _numberButton.maxValue = 1000;
        // 设置输入框中的字体大小
        _numberButton.inputFieldFont = 12;
        _numberButton.increaseTitle = @"＋";
        _numberButton.decreaseTitle = @"－";
        _numberButton.delegate = self;
    }
    
    return _numberButton;
}

/**
 加减代理回调
 
 @param numberButton 按钮
 @param number 结果
 @param increaseStatus 是否为加状态
 */
- (void)pp_numberButton:(PPNumberButton *)numberButton number:(NSInteger)number increaseStatus:(BOOL)increaseStatus
{
    if ([self.delegate respondsToSelector:@selector(ETHAmountInvesTableCellInputing: indexPath:)])
    {
        [self.delegate ETHAmountInvesTableCellInputing:[NSString stringWithFormat:@"%ld",number] indexPath:nil];
    }
}

-(NSString*)getAmountText
{
    return [NSString stringWithFormat:@"%f",_numberButton.currentNumber];
}

- (UIButton *)confirButton {
    if (_confirButton == nil) {
        _confirButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirButton.backgroundColor = RGBColorHex(0xFF5722);
        [_confirButton setTitle:@"确认出价" forState:UIControlStateNormal];
        _confirButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_confirButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirButton.layer.cornerRadius = 5;
        _confirButton.clipsToBounds = YES;
        [_confirButton addTarget:self action:@selector(confirButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirButton;
}

@end
