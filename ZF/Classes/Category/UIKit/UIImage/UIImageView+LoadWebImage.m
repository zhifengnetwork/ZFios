//
//  UIImageView+LoadWebImage.m
//  ZF
//
//  Created by admin on 2019/5/30.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "UIImageView+LoadWebImage.h"
#import "UIView+WebCache.h"

@implementation UIImageView (LoadWebImage)

- (void)setImageWithURL:(NSString *)url {
    [self sd_setShowActivityIndicatorView:YES];
    [self sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    if ([url hasPrefix:@"http"]) {
        [self sd_setImageWithURL:[NSURL URLWithString:url]];
    } else {
        [self sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ImageUrl,url]]];
    }
}

@end
