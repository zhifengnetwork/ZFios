//
//  ZFClusterWindowTableCell.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClusterWindowTableCell.h"
#import "UIImageView+WebCache.h"
#import "ZFSelectTypeView.h"
#import "TYAlertController.h"
#import "ZFTool.h"

@interface ZFClusterWindowTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UIButton* goSpellButton;

@property (nonatomic, strong)NSTimer *timer;
@end

@implementation ZFClusterWindowTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.goSpellButton];

    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(30);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-170);
        make.top.equalTo(self->_iconView.mas_top).offset(5);
        make.left.equalTo(self->_iconView.mas_right).offset(5);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(35);
        make.top.equalTo(self->_nameLabel.mas_top);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(15);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(5);
    }];
    
    [_goSpellButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self->_titleLabel.mas_right).offset(10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(28);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)goSpellButtonDidClick
{
    ZFSelectTypeView *view = [[ZFSelectTypeView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 400)];
    view.isPin = YES;
    view.found_id = self.foundModel.found_id;
    view.team_id = self.team_id;
    view.goodID = self.goodID;
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"mr"];
    }
    return _iconView;
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.text = @"强泰家居水果店";
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.text = @"还差2人拼成";
    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.text = @"剩余00:40:30";
    }
    return _timeLabel;
}

- (UIButton *)goSpellButton {
    if (_goSpellButton == nil) {
        _goSpellButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _goSpellButton.backgroundColor = RGBColorHex(0xFF5722);
        [_goSpellButton setTitle:@"去拼单" forState:UIControlStateNormal];
        _goSpellButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_goSpellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _goSpellButton.layer.cornerRadius = 3;
        _goSpellButton.clipsToBounds = YES;
        [_goSpellButton addTarget:self action:@selector(goSpellButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goSpellButton;
}

- (void)setFoundModel:(ZFTeamFoundModel *)foundModel{
    _foundModel = foundModel;

    if (!kStringIsEmpty(_foundModel.head_pic))
    {
        [_iconView sd_setImageWithURL:[NSURL URLWithString:_foundModel.head_pic]];
    }
    _titleLabel.text = [NSString stringWithFormat:@"还差%ld人拼成",_foundModel.need];
    _nameLabel.text = _foundModel.nickname;
//    _timeLabel.text = [ZFTool dateText:[NSString stringWithFormat:@"%ld",_foundModel.found_end_time]];
    // 倒计时的时间
    NSString *deadlineStr = [ZFTool dateText:[NSString stringWithFormat:@"%ld",_foundModel.found_end_time]];
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
                        weakSelf.timeLabel.text = @"当前活动已结束";
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
