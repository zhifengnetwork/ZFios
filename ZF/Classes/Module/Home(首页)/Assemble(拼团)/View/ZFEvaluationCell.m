//
//  ZFEvaluationCell.m
//  ZF
//
//  Created by weiming zhang on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFEvaluationCell.h"
#import "UIImageView+WebCache.h"

@interface ZFEvaluationCell()
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UIImageView *imageView0;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UIImageView *imageView4;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *goodImgView;
@property (nonatomic, strong)UIImageView *goodImgView1;
@property (nonatomic, strong)UIImageView *goodImgView2;
@property (nonatomic, strong)UILabel *writeTimeLabel;
@property (nonatomic, strong)UILabel *typeLabel;
@end
@implementation ZFEvaluationCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.imageView0];
    [self.contentView addSubview:self.imageView1];
    [self.contentView addSubview:self.imageView2];
    [self.contentView addSubview:self.imageView3];
    [self.contentView addSubview:self.imageView4];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.goodImgView];
    [self.contentView addSubview:self.goodImgView1];
    [self.contentView addSubview:self.goodImgView2];
    [self.contentView addSubview:self.writeTimeLabel];
    [self.contentView addSubview:self.typeLabel];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColor(204, 204, 204);
    [self.contentView addSubview:lineView];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(15);
    }];
    
    [_imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(10);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView0.mas_right).with.offset(2.5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView1.mas_right).with.offset(2.5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView2.mas_right).with.offset(2.5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];
    [_imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView3.mas_right).with.offset(2.5);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(11);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-20);
    }];

    [_goodImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self).with.offset(10);
        make.width.height.mas_equalTo(55);
    }];
    [_goodImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self.goodImgView.mas_right).with.offset(10);
        make.width.height.mas_equalTo(55);
    }];
    [_goodImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self.goodImgView1.mas_right).with.offset(10);
        make.width.height.mas_equalTo(55);
    }];

    [_writeTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodImgView.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(10);
    }];
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodImgView.mas_bottom).with.offset(15);
        make.left.equalTo(self.writeTimeLabel.mas_right).with.offset(3);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textColor = RGBColor(51, 51, 51);
        _nameLabel.text = @"l***e";
    }return _nameLabel;
}

- (UIImageView *)imageView0{
    if (_imageView0 == nil) {
        _imageView0 = [[UIImageView alloc]init];
        _imageView0.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView0;
}
- (UIImageView *)imageView1{
    if (_imageView1 == nil) {
        _imageView1 = [[UIImageView alloc]init];
        _imageView1.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView1;
}
- (UIImageView *)imageView2{
    if (_imageView2 == nil) {
        _imageView2 = [[UIImageView alloc]init];
        _imageView2.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView2;
}
- (UIImageView *)imageView3{
    if (_imageView3 == nil) {
        _imageView3 = [[UIImageView alloc]init];
        _imageView3.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView3;
}
- (UIImageView *)imageView4{
    if (_imageView4 == nil) {
        _imageView4 = [[UIImageView alloc]init];
        _imageView4.image = [UIImage imageNamed:@"xingxing"];
    }return _imageView4;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textColor = RGBColor(51, 51, 51);
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"东西收到了，衣服超级好看，特别适合我，也不掉毛凸显了黑色的高贵跟高雅，特别适合我非常感谢店家五星好评.";
    }return _titleLabel;
}

- (UIImageView *)goodImgView{
    if (_goodImgView == nil) {
        _goodImgView = [[UIImageView alloc]init];
        _goodImgView.image = [UIImage imageNamed:@"Picture"];
    }return _goodImgView;
}
- (UIImageView *)goodImgView1{
    if (_goodImgView1 == nil) {
        _goodImgView1 = [[UIImageView alloc]init];
        _goodImgView1.image = [UIImage imageNamed:@"Picture"];
    }return _goodImgView1;
}
- (UIImageView *)goodImgView2{
    if (_goodImgView2 == nil) {
        _goodImgView2 = [[UIImageView alloc]init];
        _goodImgView2.image = [UIImage imageNamed:@"Picture"];
    }return _goodImgView2;
}

- (UILabel *)writeTimeLabel{
    if (_writeTimeLabel == nil) {
        _writeTimeLabel = [[UILabel alloc]init];
        _writeTimeLabel.font = [UIFont systemFontOfSize:10];
        _writeTimeLabel.textColor = RGBColor(153, 153, 153);
        _writeTimeLabel.text = @"2019-04-28";
    }return _writeTimeLabel;
}

- (UILabel *)typeLabel{
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc]init];
        _typeLabel.font = [UIFont systemFontOfSize:10];
        _typeLabel.textColor = RGBColor(153, 153, 153);
        _typeLabel.text = @"| 黑色 XXL";
    }return _typeLabel;
}

- (void)setCommentmodel:(ZFGoodCommentModel *)commentmodel{
    _commentmodel = commentmodel;
    if (_commentmodel.is_anonymous == 1) {
        _nameLabel.text = @"匿名用户";
    }else{
        _nameLabel.text = [NSString stringWithFormat:@"%@",commentmodel.username];
    }
    
    _titleLabel.text = [NSString stringWithFormat:@"%@",commentmodel.content];
    if (_commentmodel.goods_rank == 5) {
        _imageView0.hidden = YES;
        _imageView1.hidden = YES;
        _imageView2.hidden = YES;
        _imageView3.hidden = YES;
        _imageView4.hidden = YES;
    }else if (_commentmodel.goods_rank == 4) {
        _imageView0.hidden = YES;
        _imageView1.hidden = YES;
        _imageView2.hidden = YES;
        _imageView3.hidden = YES;
    }else if (_commentmodel.goods_rank == 3){
        _imageView0.hidden = YES;
        _imageView1.hidden = YES;
        _imageView2.hidden = YES;
    }else if (_commentmodel.goods_rank == 2){
        _imageView0.hidden = YES;
        _imageView1.hidden = YES;
    }else if (_commentmodel.goods_rank == 1){
        _imageView0.hidden = YES;
    }
    
    if (_commentmodel.img.count == 0) {
        _goodImgView.hidden = YES;
        _goodImgView1.hidden = YES;
        _goodImgView2.hidden = YES;
    }else{
        if (!kStringIsEmpty(_commentmodel.img[0])) {
            NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_commentmodel.img[0]];
            [_goodImgView sd_setImageWithURL:[NSURL URLWithString:str]];
        }
        if (!kStringIsEmpty(_commentmodel.img[1])) {
            NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_commentmodel.img[1]];
            [_goodImgView1 sd_setImageWithURL:[NSURL URLWithString:str]];
        }
        if (!kStringIsEmpty(_commentmodel.img[2])) {
            NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_commentmodel.img[2]];
            [_goodImgView2 sd_setImageWithURL:[NSURL URLWithString:str]];
        }
        
    }
    
}
@end
