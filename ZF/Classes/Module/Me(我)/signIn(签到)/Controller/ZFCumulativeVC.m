//
//  ZFCumulativeVC.m
//  LK
//
//  Created by juchuangweiye on 2018/9/21.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "ZFCumulativeVC.h"

#import "UIButton+LXMImagePosition.h"
#import "SVProgressHUD.h"
#import "FSCalendar.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "UserInfoModel.h"
#import "http_user.h"
#import <DateTools.h>
#import "ZFSignInView.h"
#import "TYShowAlertView.h"

@interface ZFCumulativeVC ()<FSCalendarDataSource,FSCalendarDelegate>

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIButton *signButton;
@property (nonatomic, strong) UILabel *integralLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *totalDayLabel;

@property (weak, nonatomic) FSCalendar *calendar;
@property (weak, nonatomic) UIButton *previousButton;
@property (weak, nonatomic) UIButton *nextButton;

@property (strong, nonatomic) NSCalendar *gregorian;

- (void)previousClicked:(id)sender;
- (void)nextClicked:(id)sender;

@end

@implementation ZFCumulativeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"累计积分";
    self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [self setup];
    
    [self loadData];
}

- (void)previousClicked:(id)sender
{
    NSDate *currentMonth = self.calendar.currentPage;
    NSDate *previousMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:currentMonth options:0];
    [self.calendar setCurrentPage:previousMonth animated:YES];
}

- (void)nextClicked:(id)sender
{
    NSDate *currentMonth = self.calendar.currentPage;
    NSDate *nextMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:currentMonth options:0];
    [self.calendar setCurrentPage:nextMonth animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup
{
    self.view.backgroundColor = RGBColorHex(0xf3f5f7);
    
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.signButton];
    [self.view addSubview:self.integralLabel];
    [self.view addSubview:self.dayLabel];
    [self.view addSubview:self.totalDayLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(215);
    }];
    
    [_signButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_top).offset(16);
        make.centerX.equalTo(self->_iconView);
        make.width.mas_equalTo(152);
        make.height.mas_equalTo(41);
    }];
    
    [_integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_signButton.mas_bottom).offset(15);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_integralLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_totalDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_dayLabel.mas_bottom).offset(5);
        make.centerX.equalTo(self->_iconView);
    }];
    
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(15, 180, 345, 330)];
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    calendar.layer.borderWidth = 1.0f;
    calendar.layer.borderColor = RGBColorHex(0x999999).CGColor;
    calendar.layer.cornerRadius = 5;
    calendar.clipsToBounds = YES;
    calendar.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
    calendar.appearance.headerMinimumDissolvedAlpha = 0;
    calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase;
    [self.view addSubview:calendar];
    self.calendar = calendar;
    
    UIButton *previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
    previousButton.frame = CGRectMake(80, 180+5, 95, 34);
    previousButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [previousButton setImage:[UIImage imageNamed:@"zuojiantou"] forState:UIControlStateNormal];
    [previousButton addTarget:self action:@selector(previousClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:previousButton];
    self.previousButton = previousButton;
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(CGRectGetWidth(self.view.frame)-95-80, 180+5, 95, 34);
    nextButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [nextButton setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    self.nextButton = nextButton;
    
    //横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.right.equalTo(self.calendar);
         make.top.equalTo(self.calendar.mas_top).offset(40);
         make.height.mas_equalTo(1.0f);
     }];
}


- (void)signButtonDidClick
{
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"jianbian"];
    }
    return _iconView;
}


- (UIButton *)signButton {
    if (_signButton == nil) {
        _signButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signButton setTitle:@"已签到" forState:UIControlStateNormal];
        [_signButton setImage:[UIImage imageNamed:@"qiandao"] forState:UIControlStateNormal];
        [_signButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _signButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_signButton setImagePosition:LXMImagePositionLeft spacing:3];
        _signButton.layer.borderWidth = 1.0f;
        _signButton.layer.borderColor = RGBColorHex(0xffffff).CGColor;
        _signButton.layer.cornerRadius = 20;
        _signButton.clipsToBounds = YES;
        [_signButton addTarget:self action:@selector(signButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _signButton;
}

- (UILabel *)integralLabel {
    if (_integralLabel == nil) {
        _integralLabel = [[UILabel alloc] init];
        _integralLabel.textColor = RGBColorHex(0xffffff);
        _integralLabel.font = [UIFont systemFontOfSize:13];
        [_integralLabel sizeToFit];
        _integralLabel.text = @"+2积分";
    }
    return _integralLabel;
}

- (UILabel *)dayLabel {
    if (_dayLabel == nil) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textColor = RGBColorHex(0xffffff);
        _dayLabel.font = [UIFont systemFontOfSize:13];
        [_dayLabel sizeToFit];
        _dayLabel.text = @"已连续签到：3天";
    }
    return _dayLabel;
}

- (UILabel *)totalDayLabel {
    if (_totalDayLabel == nil) {
        _totalDayLabel = [[UILabel alloc] init];
        _totalDayLabel.textColor = RGBColorHex(0xffffff);
        _totalDayLabel.font = [UIFont systemFontOfSize:14];
        [_totalDayLabel sizeToFit];
        _totalDayLabel.text = @"累积签到：22天";
    }
    return _totalDayLabel;
}


-(void)loadData
{
    ZWeakSelf
    [http_user AppGetSignDay:^(id responseObject)
     {
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if(kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.signInModel = [ZFSignInModel mj_objectWithKeyValues:responseObject];
    
    
    self.dayLabel.text = [NSString stringWithFormat:@"已连续签到：%@天",self.signInModel.continue_sign];
    self.totalDayLabel.text = [NSString stringWithFormat:@"累积签到：%@天",self.signInModel.accumulate_day];
    
    if (self.signInModel.auth.integerValue == 1) {
        self.integralLabel.text = [NSString stringWithFormat:@"+%@积分",self.signInModel.add_point];
        if (self.signInModel.today_sign==NO)
        {
            [self loadData2];
        }
    }else{
        [SVProgressHUD showErrorWithStatus:@"只有 分销商 以及 购买399以后才可以签到"];
    }
}

-(void)loadData2
{
    ZWeakSelf
    [http_user AppSign:^(id responseObject)
     {
         [weakSelf showData2:responseObject];
     } failure:^(NSError *error) {
         
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData2:(id)responseObject
{
    //跳转到签到成功
    ZFSignInView* windowView = [[ZFSignInView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    [TYShowAlertView showAlertViewWithView:windowView backgoundTapDismissEnable:YES];
    ZFSignInModel *signInModel = [ZFSignInModel mj_objectWithKeyValues:responseObject];
    windowView.signInModel = signInModel;
}

/**
 * Asks the dataSource for an image for the specific date.
 */
- (nullable UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date
{
    NSString* str = [date formattedDateWithFormat:@"yyyy/M/dd"];
    
    for (int i= 0; i<self.signInModel.date.count; i++) {
        
        NSString* date2 = [self.signInModel.date objectAtIndex:i];
        if( [str isEqualToString:date2])
        {
            return [UIImage imageNamed:@"qiandao1"];
        }
    }
    
    return nil;
}



@end
