//
//  ZFMenuCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/13.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFMenuCell.h"

@implementation ZFMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.showCarLabel];
    }
    return self;
}
- (UILabel *)showCarLabel{
    if (!_showCarLabel) {
        self.showCarLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, (LL_ScreenWidth/2) - 56, 22)];
        self.showCarLabel.font = [UIFont systemFontOfSize:12];
        self.showCarLabel.textAlignment = NSTextAlignmentCenter;
        
        self.lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 22, (LL_ScreenWidth)/2 - 65, 0.5)];
        self.lineLabel.backgroundColor = [UIColor blackColor];
        [self.showCarLabel addSubview:_lineLabel];
        
        self.img = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.showCarLabel.frame)+ 6, 0, 22, 22)];
        self.img.image = [UIImage imageNamed:@"down"];
        [self.showCarLabel addSubview:_img];
        
    }
    return _showCarLabel;
}
- (void)configureWithStr:(NSString *)Str boundsWidth:(CGFloat)width{
    self.showCarLabel.text = Str;
    self.showCarLabel.frame = CGRectMake(0, 0, width, 22);
    self.lineLabel.frame = CGRectMake(0, 22, width, 0.5);
    self.img.image =[UIImage imageNamed:@"down_b"];
    self.img.frame = CGRectMake(CGRectGetMaxX(self.showCarLabel.frame)+ 6, 0, 22, 22);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
