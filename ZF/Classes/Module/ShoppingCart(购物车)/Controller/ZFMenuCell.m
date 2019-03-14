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
        self.backgroundColor = RGBColorHex(0xf9f9f9);
        
        self.showCarLabel = [[UILabel alloc]init];
        self.showCarLabel.font = [UIFont systemFontOfSize:12];
        self.showCarLabel.textAlignment = NSTextAlignmentCenter;
        
        self.lineLabel = [[UILabel alloc]init];
        self.lineLabel.backgroundColor = [UIColor blackColor];
        [self.showCarLabel addSubview:_lineLabel];
        
        
        
    }
    return _showCarLabel;
}
- (void)configureWithStr:(NSString *)Str boundsWidth:(CGFloat)width{
    
    self.showCarLabel.text = Str;
    self.showCarLabel.frame = CGRectMake(0, 0, width, 22);
    self.lineLabel.frame = CGRectMake(0, 22, width, 0.5);

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
