//
//  ZFSelectPayCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/19.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSelectPayCell.h"
@interface ZFSelectPayCell()
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UIButton *selectedBtn;
@end
@implementation ZFSelectPayCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.textLabel setFont:[UIFont systemFontOfSize:14]];
        [self.textLabel setTextColor:RGBColorHex(0x0f0f0f)];
       
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.selectedBtn];
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBColorHex(0xf5f5f5);
        
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(16);
            make.right.equalTo(self).with.offset(-16);
            make.top.equalTo(self);
            make.height.mas_equalTo(1);
        }];
        
    }
    return _lineView;
}
- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    [_selectedBtn setSelected:selected];
}
- (UIButton *)selectedBtn{
    if (!_selectedBtn) {
        _selectedBtn = [[UIButton alloc]init];
        [self.contentView addSubview:_selectedBtn];
        [_selectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).with.offset(-38);
            make.centerY.equalTo(self.mas_centerY);
        }];
        [_selectedBtn setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
        [_selectedBtn setImage:nil forState:UIControlStateNormal];
    }
    return _selectedBtn;
}

@end
