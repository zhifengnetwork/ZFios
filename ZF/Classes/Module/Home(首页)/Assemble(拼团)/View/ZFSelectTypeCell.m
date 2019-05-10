//
//  ZFSelectTypeCell.m
//  ZF
//
//  Created by weiming zhang on 2019/5/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSelectTypeCell.h"
@interface ZFSelectTypeCell()
@property (nonatomic, strong)UILabel *typeLabel;
@property (nonatomic, strong)UIButton *typeButton;
@property (nonatomic, strong)UIButton *typeButton1;
@property (nonatomic, strong)UIButton *typeButton2;
@property (nonatomic, strong)UIButton *typeButton3;
@property (nonatomic, strong)UIButton *typeButton4;
@property (nonatomic, strong)UIButton *typeButton5;
@property (nonatomic, strong)UIButton *typeButton6;
@property (nonatomic, strong)UIButton *typeButton7;

@property (nonatomic, strong)UIButton *oldButton;
@end
@implementation ZFSelectTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup{
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.typeButton];
    [self.contentView addSubview:self.typeButton1];
    [self.contentView addSubview:self.typeButton2];
    [self.contentView addSubview:self.typeButton3];
    [self.contentView addSubview:self.typeButton4];
    [self.contentView addSubview:self.typeButton5];
    [self.contentView addSubview:self.typeButton6];
    [self.contentView addSubview:self.typeButton7];
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(13);
        make.left.equalTo(self).with.offset(20);
    }];
    
    [_typeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.typeLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(20);
    }];
    
    [_typeButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.typeButton.mas_top);
        make.left.equalTo(self.typeButton.mas_right).with.offset(15);
    }];
    
    [_typeButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.typeButton.mas_top);
        make.left.equalTo(self.typeButton1.mas_right).with.offset(15);
    }];
    
    [_typeButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.typeButton.mas_top);
        make.left.equalTo(self.typeButton2.mas_right).with.offset(15);
    }];
    
    [_typeButton4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.typeButton.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(20);
    }];
    
    [_typeButton5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.typeButton4.mas_top);
        make.left.equalTo(self.typeButton4.mas_right).with.offset(15);
    }];
    
    [_typeButton6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.typeButton4.mas_top);
        make.left.equalTo(self.typeButton5.mas_right).with.offset(15);
    }];
    
    [_typeButton7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(88);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.typeButton4.mas_top);
        make.left.equalTo(self.typeButton6.mas_right).with.offset(15);
    }];

}

- (UILabel *)typeLabel{
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc]init];
        _typeLabel.font = [UIFont systemFontOfSize:12];
        _typeLabel.textColor = RGBColorHex(0x333333);
        _typeLabel.text = @"款式";
    }return _typeLabel;
}

- (UIButton *)typeButton{
    if (_typeButton == nil) {
        _typeButton = [[UIButton alloc]init];
        _typeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton.layer.borderWidth = 1;
        _typeButton.tag = 1;
        _typeButton.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton.hidden = YES;
    }return _typeButton;
}

- (UIButton *)typeButton1{
    if (_typeButton1 == nil) {
        _typeButton1 = [[UIButton alloc]init];
        _typeButton1.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton1.layer.borderWidth = 1;
        _typeButton1.tag = 2;
        _typeButton1.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton1 setTitle:@"黑色" forState:UIControlStateNormal];
        [_typeButton1 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton1 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton1 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton1.hidden = YES;
    }return _typeButton1;
}

- (UIButton *)typeButton2{
    if (_typeButton2 == nil) {
        _typeButton2 = [[UIButton alloc]init];
        _typeButton2.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton2.layer.borderWidth = 1;
        _typeButton2.tag = 3;
        _typeButton2.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton2 setTitle:@"蓝色" forState:UIControlStateNormal];
        [_typeButton2 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton2 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton2 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton2.hidden = YES;
    }return _typeButton2;
}

- (UIButton *)typeButton3{
    if (_typeButton3 == nil) {
        _typeButton3 = [[UIButton alloc]init];
        _typeButton3.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton3.layer.borderWidth = 1;
        _typeButton3.tag = 4;
        _typeButton3.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton3 setTitle:@"黄色" forState:UIControlStateNormal];
        [_typeButton3 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton3 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton3 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton3.hidden = YES;
    }return _typeButton3;
}

- (UIButton *)typeButton4{
    if (_typeButton4 == nil) {
        _typeButton4 = [[UIButton alloc]init];
        _typeButton4.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton4.layer.borderWidth = 1;
        _typeButton4.tag = 5;
        _typeButton4.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton4 setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton4 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton4 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton4 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton4.hidden = YES;
    }return _typeButton4;
}

- (UIButton *)typeButton5{
    if (_typeButton5 == nil) {
        _typeButton5 = [[UIButton alloc]init];
        _typeButton5.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton5.layer.borderWidth = 1;
        _typeButton5.tag = 6;
        _typeButton5.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton5 setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton5 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton5 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton5 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton5.hidden = YES;
    }return _typeButton5;
}

- (UIButton *)typeButton6{
    if (_typeButton6 == nil) {
        _typeButton6 = [[UIButton alloc]init];
        _typeButton6.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton6.layer.borderWidth = 1;
        _typeButton6.tag = 7;
        _typeButton6.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton6 setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton6 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton6 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton6 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton6.hidden = YES;
    }return _typeButton6;
}

- (UIButton *)typeButton7{
    if (_typeButton7 == nil) {
        _typeButton7 = [[UIButton alloc]init];
        _typeButton7.titleLabel.font = [UIFont systemFontOfSize:12];
        _typeButton7.layer.borderWidth = 1;
        _typeButton7.tag = 8;
        _typeButton7.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        [_typeButton7 setTitle:@"红色" forState:UIControlStateNormal];
        [_typeButton7 setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        [_typeButton7 setTitleColor:RGBColorHex(0xe82f5c) forState:UIControlStateSelected];
        [_typeButton7 addTarget:self action:@selector(typeChange:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton7.hidden = YES;
    }return _typeButton7;
}

- (void)setSpec_key_name:(NSString *)spec_key_name{
    if ([spec_key_name containsString:_typeButton.titleLabel.text]){
        [self typeChange:_typeButton];
    }else if ([spec_key_name containsString:_typeButton1.titleLabel.text]){
        [self typeChange:_typeButton1];
    }else if ([spec_key_name containsString:_typeButton2.titleLabel.text]){
        [self typeChange:_typeButton2];
    }else if ([spec_key_name containsString:_typeButton3.titleLabel.text]){
        [self typeChange:_typeButton3];
    }else if ([spec_key_name containsString:_typeButton4.titleLabel.text]){
        [self typeChange:_typeButton4];
    }else if ([spec_key_name containsString:_typeButton5.titleLabel.text]){
        [self typeChange:_typeButton5];
    }else if ([spec_key_name containsString:_typeButton6.titleLabel.text]){
        [self typeChange:_typeButton6];
    }else if ([spec_key_name containsString:_typeButton7.titleLabel.text]){
        [self typeChange:_typeButton7];
    }
    
}

- (void)setType:(NSMutableArray *)type{
    _type = type;
    ZFGoodModel *model = type[0];
    _typeLabel.text = [NSString stringWithFormat:@"%@",model.name];
    if ([type count]>=1) {
        _typeButton.hidden = NO;
        ZFGoodModel *model = type[0];
        [_typeButton setTitle:[NSString stringWithFormat:@"%@",model.item] forState:UIControlStateNormal];
        
        if ([type count]>=2) {
            _typeButton1.hidden = NO;
            ZFGoodModel *model = type[1];
            [_typeButton1 setTitle:[NSString stringWithFormat:@"%@",model.item] forState:UIControlStateNormal];
            
            if ([type count]>=3) {
                _typeButton2.hidden = NO;
                ZFGoodModel *model = type[2];
                [_typeButton2 setTitle:[NSString stringWithFormat:@"%@",model.item] forState:UIControlStateNormal];
                
                if ([type count]>=4) {
                    _typeButton3.hidden = NO;
                    ZFGoodModel *model = type[3];
                    [_typeButton3 setTitle:[NSString stringWithFormat:@"%@",model.item] forState:UIControlStateNormal];
                    
                    if ([type count]>=5) {
                        _typeButton4.hidden = NO;
                        ZFGoodModel *model = type[4];
                        [_typeButton4 setTitle:[NSString stringWithFormat:@"%@",model.item] forState:UIControlStateNormal];
                        
                        if ([type count]>=6) {
                            _typeButton5.hidden = NO;
                            ZFGoodModel *model = type[5];
                            [_typeButton5 setTitle:[NSString stringWithFormat:@"%@",model.item] forState:UIControlStateNormal];
                            
                            if ([type count]>=7) {
                                _typeButton6.hidden = NO;
                                ZFGoodModel *model = type[6];
                                [_typeButton6 setTitle:[NSString stringWithFormat:@"%@",model.item] forState:UIControlStateNormal];
                                
                                if ([type count]==8) {
                                    _typeButton7.hidden = NO;
                                    ZFGoodModel *model = type[7];
                                    [_typeButton7 setTitle:[NSString stringWithFormat:@"%@",model.item] forState:UIControlStateNormal];
                                }
                            }
                        }
                    }
                }
            }
        }
    }
   
    
    
}
#pragma mark 方法

- (void)typeChange: (UIButton *)btn{
    btn.selected = YES;
    btn.layer.borderColor = RGBColorHex(0xe82f5c).CGColor;
    
    if (_oldButton.tag !=btn.tag) {
        _oldButton.layer.borderColor = RGBColorHex(0xcccccc).CGColor;
        _oldButton.selected = NO;
        _oldButton = btn;
    }else{
        _oldButton = btn;
    }
    //获取a规格id
    NSInteger i = btn.tag-1;
    ZFGoodModel *model = self.type[i];
    [self.delegate selectKeyID:model.ID Cell:self];
}

@end
