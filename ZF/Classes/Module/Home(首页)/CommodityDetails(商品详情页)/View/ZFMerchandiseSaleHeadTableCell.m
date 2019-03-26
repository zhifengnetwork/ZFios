//
//  ZFMerchandiseSaleHeadTableCell.m
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMerchandiseSaleHeadTableCell.h"
#import "UIButton+LXMImagePosition.h"
#import "ZFMerchandiseSaleCollectionCell.h"

@interface ZFMerchandiseSaleHeadTableCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* saleLabel;
@property (nonatomic, strong) UIButton* goShopButton;

@property (nonatomic, strong) UICollectionView* collectionView;

@end

@implementation ZFMerchandiseSaleHeadTableCell

static NSString *const ZFMerchandiseSaleCollectionCellID = @"ZFMerchandiseSaleCollectionCellID";

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
    [self.contentView addSubview:self.saleLabel];
    [self.contentView addSubview:self.goShopButton];
    
    [self.contentView addSubview:self.collectionView];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.width.height.mas_equalTo(55);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_top).offset(8);
        make.left.equalTo(self->_iconView.mas_right).offset(10);
    }];
    
    [_saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(10);
        make.left.equalTo(self->_iconView.mas_right).offset(10);
    }];
    
    [_goShopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.equalTo(self.contentView);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xE8E8E8);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)goShopButtonDidClick
{
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"image"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x0f0f0f);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"天乐数码旗舰店";
    }
    return _nameLabel;
}

- (UILabel *)saleLabel {
    if (_saleLabel == nil) {
        _saleLabel = [[UILabel alloc] init];
        _saleLabel.textColor = RGBColorHex(0x404040);
        _saleLabel.font = [UIFont systemFontOfSize:12];
        _saleLabel.text = @"在售商品 69 件";
    }
    return _saleLabel;
}

- (UIButton *)goShopButton {
    if (_goShopButton == nil) {
        _goShopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goShopButton setTitle:@"进入品牌" forState:UIControlStateNormal];
        [_goShopButton setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [_goShopButton setTitleColor:RGBColorHex(0xE60B30) forState:UIControlStateNormal];
        _goShopButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_goShopButton setImagePosition:LXMImagePositionRight spacing:10];
        [_goShopButton addTarget:self action:@selector(goShopButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goShopButton;
}

#pragma mark - dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZFMerchandiseSaleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFMerchandiseSaleCollectionCellID forIndexPath:indexPath];
    
    return cell;
}


//预览cell点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (UICollectionView *)collectionView {
    if (_collectionView == nil)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        float fw = (kScreenWidth-30)*0.25;
        layout.itemSize = CGSizeMake(fw, 60);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ZFMerchandiseSaleCollectionCell class] forCellWithReuseIdentifier:ZFMerchandiseSaleCollectionCellID];
    }
    return _collectionView;
}



@end
