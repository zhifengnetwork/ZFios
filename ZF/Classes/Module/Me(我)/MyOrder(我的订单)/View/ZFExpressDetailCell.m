
//
//  ZFExpressDetailCell.m
//  ZF
//
//  Created by weiming zhang on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFExpressDetailCell.h"
@interface ZFExpressDetailCell()
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *expressLabel;
@end
@implementation ZFExpressDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup{
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.expressLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self).with.offset(10);
        make.width.mas_equalTo(70);
    }];
    
    [_expressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.timeLabel.mas_right).with.offset(20);
        make.right.equalTo(self).with.offset(-10);
    }];
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = RGBColorHex(0x999999);
        _timeLabel.numberOfLines = 0;
    }return _timeLabel;
}

- (UILabel *)expressLabel{
    if (_expressLabel == nil) {
        _expressLabel = [[UILabel alloc]init];
        _expressLabel.font = [UIFont systemFontOfSize:12];
        _expressLabel.textColor = RGBColorHex(0x999999);
        _expressLabel.numberOfLines = 0;
    }return _expressLabel;
}

- (void)setModel:(ZFUserModel *)model{
    _model = model;
    _timeLabel.text = [NSString stringWithFormat:@"%@",model.time];
    _expressLabel.text = [NSString stringWithFormat:@"%@",model.status];
}

@end
