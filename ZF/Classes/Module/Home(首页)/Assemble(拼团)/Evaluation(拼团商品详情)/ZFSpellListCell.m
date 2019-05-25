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
#import "ZFSelectTypeView.h"
#import "TYAlertController.h"

@interface ZFSpellListCell()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *lackNumberLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIButton *spellListButton;

@property(nonatomic,strong)NSTimer*timer;
@end
@implementation ZFSpellListCell


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
        [_spellListButton addTarget:self action:@selector(spellClick) forControlEvents:UIControlEventTouchUpInside];
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
//    self.timeLabel.text = [ZFTool startDate:[NSString stringWithFormat:@"%ld",self.teamModel.found_end_time]];
    // 倒计时的时间
    NSString *deadlineStr = [ZFTool dateText:[NSString stringWithFormat:@"%ld",teamModel.found_end_time]];
    // 当前时间的时间戳
    NSString *nowStr = [ZFTool getCurrentTimeyyyymmdd];
    // 计算时间差值
    NSInteger secondsCountDown = [ZFTool getDateDifferenceWithNowDateStr:nowStr deadlineStr:deadlineStr];
    
    //添加倒计时
    __weak __typeof(self) weakSelf = self;
    
    if (_timer == nil) {
        __block NSInteger timeout = secondsCountDown; // 倒计时时间
        
        if (timeout!=0) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
            dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC,  0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout <= 0){ //  当倒计时结束时做需要的操作: 关闭 活动到期不能提交
                    dispatch_source_cancel(_timer);
                    _timer = nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        weakSelf.timeLabel.text = @"拼单已结束";
                        weakSelf.spellListButton.enabled = NO;
                    });
                } else { // 倒计时重新计算 时/分/秒
                    NSInteger days = (int)(timeout/(3600*24));
                    NSInteger hours = (int)((timeout-days*24*3600)/3600);
                    NSInteger minute = (int)(timeout-days*24*3600-hours*3600)/60;
                    NSInteger second = timeout - days*24*3600 - hours*3600 - minute*60;
                    NSString *strTime = [NSString stringWithFormat:@"剩余 %02ld : %02ld : %02ld", hours, minute, second];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (days == 0) {
                            weakSelf.timeLabel.text = strTime;
                        } else {
                            weakSelf.timeLabel.text = [NSString stringWithFormat:@"剩余 %ld天 %02ld : %02ld : %02ld", days, hours, minute, second];
                        }
                        
                    });
                    timeout--; // 递减 倒计时-1(总时间以秒来计算)
                }
            });
            dispatch_resume(_timer);
        }
    }

}

- (void)spellClick{
    ZFSelectTypeView *view = [[ZFSelectTypeView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 400)];
    view.isPin = YES;
    view.found_id = self.teamModel.found_id;
    view.team_id = self.team_id;
    view.goodID = self.goodID;
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];
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
