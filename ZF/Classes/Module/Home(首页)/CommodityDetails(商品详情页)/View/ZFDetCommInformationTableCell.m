//
//  ZFDetCommInformationTableCell.m
//  ZF
//
//  Created by admin on 2019/3/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetCommInformationTableCell.h"
#import "UIButton+LXMImagePosition.h"
#import "http_mine.h"
#import "stdlib.h"
#import "ZFTool.h"
#import "SVProgressHUD.h"

@interface ZFDetCommInformationTableCell()

@property (nonatomic, strong) UILabel* secondLabel;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* symbolLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* priceLabel;
@property (nonatomic, strong) UILabel* money2Label;
@property (nonatomic, strong) UILabel* salesLabel;
@property (nonatomic, strong) UILabel* stockLabel;
@property (nonatomic, strong) MASConstraint  *right;
@property (nonatomic, strong)UIButton *collectionButton;
@property (nonatomic, strong)UILabel *addressLabel;

@property (nonatomic, strong)NSTimer *timer;
@end

@implementation ZFDetCommInformationTableCell

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
//    [self.contentView addSubview:self.secondLabel];
    [self.contentView addSubview:self.nameLabel];
//    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.symbolLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.money2Label];
    [self.contentView addSubview:self.salesLabel];
    [self.contentView addSubview:self.stockLabel];
    [self.contentView addSubview:self.collectionButton];
    [self.contentView addSubview:self.addressLabel];
//    [_secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(15);
//        make.top.mas_equalTo(15);
//        make.width.mas_equalTo(40);
//        make.height.mas_equalTo(18);
//    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(15);
    }];
    
//    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(15);
//        make.top.equalTo(self->_nameLabel.mas_bottom).offset(20);
//        make.right.mas_equalTo(-20);
//    }];
    
    [_symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.bottom.equalTo(self->_moneyLabel.mas_bottom).offset(-3);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.symbolLabel.mas_right).with.offset(5);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right).offset(15);
        make.bottom.equalTo(self->_moneyLabel.mas_bottom);
    }];
    
    [_money2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_priceLabel.mas_right).offset(5);
        make.bottom.equalTo(self->_priceLabel.mas_bottom);
    }];
    
    [_collectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_top);
        make.bottom.equalTo(self.money2Label.mas_bottom);
        make.right.mas_equalTo(-12);
    }];
    
    [_salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(15);
        make.bottom.mas_equalTo(-15);
    }];
    
    [_stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.salesLabel);
        self.right = make.centerX.equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(-15);
    }];
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.equalTo(self.stockLabel.mas_centerY);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xf8f8f8);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(5);
     }];
    
    //划线
    UIView *hLine2View = [[UIView alloc] init];
    hLine2View.backgroundColor = RGBColorHex(0x999999);
    [self.contentView addSubview:hLine2View];
    
    [hLine2View mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.centerX.equalTo(self->_money2Label);
         make.width.mas_equalTo(40);
         make.height.mas_equalTo(0.5);
     }];
    
}

-(void)setDetailsPageModel:(ZFDetailsPageModel *)detailsPageModel
{
    _detailsPageModel = detailsPageModel;
    
    _nameLabel.text = _detailsPageModel.goods_name;
    _titleLabel.text = _detailsPageModel.goods_remark;
    if (!kStringIsEmpty(_detailsPageModel.prom_price)) {
        _symbolLabel.text = @"团购价¥";
        _symbolLabel.font = [UIFont systemFontOfSize:19];
        _moneyLabel.text = [NSString stringWithFormat:@"%@",_detailsPageModel.prom_price];
        _money2Label.text = [NSString stringWithFormat:@"¥%@",_detailsPageModel.shop_price];
        _salesLabel.backgroundColor = RGBColorHex(0xda2a20);
        _salesLabel.textColor = [UIColor whiteColor];
//        _salesLabel.text = [ZFTool GroupBuying:[NSString stringWithFormat:@"%ld",_detailsPageModel.end_time]];
        
        // 倒计时的时间
        NSString *deadlineStr = [ZFTool dateText:[NSString stringWithFormat:@"%ld",_detailsPageModel.end_time]];
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
                            weakSelf.salesLabel.text = @"当前活动已结束";
                        });
                    } else { // 倒计时重新计算 时/分/秒
                        NSInteger days = (int)(timeout/(3600*24));
                        NSInteger hours = (int)((timeout-days*24*3600)/3600);
                        NSInteger minute = (int)(timeout-days*24*3600-hours*3600)/60;
                        NSInteger second = timeout - days*24*3600 - hours*3600 - minute*60;
                        NSString *strTime = [NSString stringWithFormat:@"限时团购 %02ld小时%02ld分 %02ld秒", hours, minute, second];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (days == 0) {
                                weakSelf.salesLabel.text = strTime;
                            } else {
                                weakSelf.salesLabel.text = [NSString stringWithFormat:@"限时团购 %ld天%02ld小时%02ld分%02ld秒", days, hours, minute, second];
                            }

                        });
                        timeout--; // 递减 倒计时-1(总时间以秒来计算)
                    }
                });
                dispzzatch_resume(_timer);
            }
        }
        
        
        
        //修改运费的约束z
        [self.right uninstall];
        [self.stockLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-108);
        }];
    }else{
        _moneyLabel.text = _detailsPageModel.shop_price;
        _money2Label.text = [NSString stringWithFormat:@"¥%@",_detailsPageModel.market_price];
         _salesLabel.text = [NSString stringWithFormat:@"销量：%@",_detailsPageModel.virtual_sales_sum];
    }
    
   
    if (_detailsPageModel.is_free_shipping.integerValue == 1) {
        _stockLabel.text = @"运费：￥0.00";
    }
    self.collectionButton.selected = _detailsPageModel.is_collect;
    _addressLabel.text = [NSString stringWithFormat:@"%@%@",_detailsPageModel.seller_info.province_name,_detailsPageModel.seller_info.city_name];
    
    if ([_detailsPageModel.is_collect isEqualToString:@"1"])
    {
        _collectionButton.selected = YES;
    }
    else
    {
        _collectionButton.selected = NO;
    }
}

- (void)setFreight:(NSString *)freight{
    _freight = freight;
    _stockLabel.text = [NSString stringWithFormat:@"运费：￥%@",_freight];
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x1a1a1a);
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.text = @"Apple/p iphone XR";
    }
    return _nameLabel;
}

//- (UILabel *)titleLabel {
//    if (_titleLabel == nil) {
//        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.textColor = RGBColorHex(0x404040);
//        _titleLabel.font = [UIFont systemFontOfSize:13];
//        _titleLabel.text = @"苹果 iphone XR 移动联通电信4G双卡双待苹果 iphone XR 苹果 iphone XR ";
//        _titleLabel.numberOfLines = 0;
//    }
//    return _titleLabel;
//}

- (UILabel *)symbolLabel {
    if (_symbolLabel == nil) {
        _symbolLabel = [[UILabel alloc] init];
        _symbolLabel.textColor = RGBColorHex(0xda2a20);
        _symbolLabel.font = [UIFont boldSystemFontOfSize:21];
        _symbolLabel.text = @"¥";
    }
    return _symbolLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xda2a20);
        _moneyLabel.font = [UIFont boldSystemFontOfSize:21];
        _moneyLabel.text = @"7999";
    }
    return _moneyLabel;
}

- (UILabel *)priceLabel {
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = RGBColorHex(0x999999);
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.text = @"市场价:";
    }
    return _priceLabel;
}

- (UILabel *)money2Label {
    if (_money2Label == nil) {
        _money2Label = [[UILabel alloc] init];
        _money2Label.textColor = RGBColorHex(0x999999);
        _money2Label.font = [UIFont systemFontOfSize:15];
        _money2Label.text = @"7999";
    }
    return _money2Label;
}

- (UIButton *)collectionButton {
    if (_collectionButton == nil) {
        _collectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectionButton setImage:[UIImage imageNamed:@"collection1"] forState:UIControlStateNormal];
        [_collectionButton setImage:[UIImage imageNamed:@"collection2"] forState:UIControlStateSelected];
        [_collectionButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        _collectionButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [_collectionButton setImagePosition:LXMImagePositionTop spacing:6];
        [_collectionButton addTarget:self action:@selector(collectionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectionButton;
}


- (UILabel *)salesLabel {
    if (_salesLabel == nil) {
        _salesLabel = [[UILabel alloc] init];
        _salesLabel.textColor = RGBColorHex(0x999999);
        _salesLabel.font = [UIFont systemFontOfSize:14];
        _salesLabel.text = @"销量：1W+";
    }
    return _salesLabel;
}

- (UILabel *)stockLabel {
    if (_stockLabel == nil) {
        _stockLabel = [[UILabel alloc] init];
        _stockLabel.textColor = RGBColorHex(0x999999);
        _stockLabel.font = [UIFont systemFontOfSize:14];
        _stockLabel.text = @"当前库存：1+件";
    }
    return _stockLabel;
}

- (UILabel *)addressLabel{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.textColor = RGBColorHex(0x999999);
        _addressLabel.font = [UIFont systemFontOfSize:14];
        _addressLabel.text = @"广东广州";
    }return _addressLabel;
}

- (void)collectionButtonDidClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (_collectionButton.selected == YES) {
        [http_mine collect_goods:_detailsPageModel.goods_id.intValue success:^(id responseObject)
         {
             [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
         } failure:^(NSError *error) {
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }else{
        [http_mine del_collect_goods:_detailsPageModel.goods_id.intValue success:^(id responseObject)
         {
             [SVProgressHUD showSuccessWithStatus:@"删除收藏成功"];
         } failure:^(NSError *error) {
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }
}
@end
