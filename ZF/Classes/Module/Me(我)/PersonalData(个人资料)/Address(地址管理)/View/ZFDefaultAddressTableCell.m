//
//  ZFDefaultAddressTableCell.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDefaultAddressTableCell.h"

@interface ZFDefaultAddressTableCell()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UISwitch* switchFunc;

@end

@implementation ZFDefaultAddressTableCell

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
    self.contentView.backgroundColor = TableViewBGColor;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.switchFunc];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_switchFunc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(49.0f, 31.0f));
        make.left.equalTo(self->_titleLabel.mas_right).offset(25);
    }];

    
}



- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x666666);
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"设置默认地址(每次下单会使用该地址)";
    }
    return _titleLabel;
}

-(UISwitch *)switchFunc{
    if(_switchFunc == nil){
        _switchFunc = [[UISwitch alloc]init];
        [_switchFunc setBackgroundColor:RGBColorHex(0xF22E00)];
        [_switchFunc setOnTintColor:RGBColorHex(0x99999)];
        [_switchFunc setThumbTintColor:[UIColor whiteColor]];
        _switchFunc.layer.cornerRadius = 15.5f;
        _switchFunc.layer.masksToBounds = YES;
        [_switchFunc addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchFunc;
}

@end
