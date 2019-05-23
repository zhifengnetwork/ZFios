//
//  ZFSpellListCell.m
//  ZF
//
//  Created by weiming zhang on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpellListCell.h"
#import "UIImageView+WebCache.h"
#import "ZFTool.h"

@interface ZFSpellListCell()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *lackNumberLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIButton *spellListButton;

//@property(nonatomic,strong)NSTimer*countDownTimer;
@end
@implementation ZFSpellListCell

//倒计时总的秒数
//static NSInteger  secondsCountDown = 86400;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setup];
    }
    return self;
}

- (void)setup{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.lackNumberLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.spellListButton];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(25);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(30);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(6);
        make.top.equalTo(self).with.offset(13);
    }];
    
    [_spellListButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-25);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(25);
    }];
    
    [_lackNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.spellListButton.mas_left).with.offset(-10);
        make.top.equalTo(self.spellListButton.mas_top);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.spellListButton.mas_left).with.offset(-10);
        make.bottom.equalTo(self.spellListButton.mas_bottom);
    }];
    
}
- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.layer.cornerRadius = 15;
    }return _iconImageView;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textColor = RGBColor(51, 51, 51);
        _nameLabel.text = @"握不住的沙和他";
    }return _nameLabel;
}

- (UIButton *)spellListButton{
    if (_spellListButton == nil) {
        _spellListButton = [[UIButton alloc]init];
        _spellListButton.layer.cornerRadius = 5;
        _spellListButton.backgroundColor = RGBColor(232, 47, 92);
        _spellListButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_spellListButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_spellListButton setTitle:@"去拼单" forState:UIControlStateNormal];
    }return _spellListButton;
}

- (UILabel *)lackNumberLabel{
    if (_lackNumberLabel == nil) {
        _lackNumberLabel = [[UILabel alloc]init];
        _lackNumberLabel.font = [UIFont systemFontOfSize:10];
        _lackNumberLabel.textColor = RGBColor(51, 51, 51);
        _lackNumberLabel.text = @"还差2人拼成";
    }return _lackNumberLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textColor = RGBColor(51, 51, 51);
        _timeLabel.text = @"剩余00:30:00";
    }return _timeLabel;
}

- (void)setTeamModel:(ZFTeamFoundModel *)teamModel{
    _teamModel = teamModel;
    if (!kStringIsEmpty(_teamModel.head_pic))
    {
        [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_teamModel.head_pic]];
    }
    _nameLabel.text = _teamModel.nickname;
    _lackNumberLabel.text = [NSString stringWithFormat:@"还差%ld人拼成",_teamModel.need];
    self.timeLabel.text = [ZFTool startDate:[NSString stringWithFormat:@"%ld",self.teamModel.found_end_time]];
    

}

//实现倒计时动作
//-(void)countDownAction{
//    //倒计时-1
//    secondsCountDown--;
//
//    //重新计算 时/分/秒
//    NSString *str_hour = [NSString stringWithFormat:@"%02ld",secondsCountDown/3600];
//
//    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(secondsCountDown%3600)/60];
//
//    NSString *str_second = [NSString stringWithFormat:@"%02ld",secondsCountDown%60];
//
//    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
//    //修改倒计时标签及显示内容
//    self.timeLabel.text=[NSString stringWithFormat:@"剩余%@",format_time];
//
//
//    //当倒计时到0时做需要的操作，比如验证码过期不能提交
//    if(secondsCountDown==0){
//        _spellListButton.enabled = NO;
//        [_countDownTimer invalidate];
//    }
//
//}
@end
