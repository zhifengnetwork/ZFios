//
//  ZFTool.m
//  ZF
//
//  Created by apple on 2018/12/30.
//  Copyright © 2018 LS. All rights reserved.
//

#import "ZFTool.h"
#import "SDWebImageManager.h"
#import <DateTools.h>


@implementation ZFTool

/**
 *  是否是邮箱
 *
 *  @param email email description
 *
 *  @return <#return value description#>
 */
+ (BOOL) isEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

/**
 *  手机号码判断
 *
 *  @return <#return value description#>
 */
+ (BOOL) isPhoneNumber:(NSString *)PhoneNumber
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:PhoneNumber];
}

/**
 *  将一个带有分隔符的字符串拆分成数组
 *
 *  @param strData     带有分隔符的字符串
 *  @param strSeparator     分隔符
 *  @return NSMutableArray 拆分后的数组
 */
+(NSMutableArray *)strToArr: (NSString*)strData Separator:(NSString*)strSeparator
{
    NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:[strData componentsSeparatedByString:strSeparator]];
    
    return arr;
}

/**
 *  将一个数组拆分组成带有分隔符的字符串
 *
 *  @param NSMutableArray 拆分的数组
 *  @param strSeparator     分隔符
 *  @return strData     带有分隔符的字符串
 */
+(NSString *)ArrTostr: (NSMutableArray*)arrData Separator:(NSString*)strSeparator
{
    NSString *str = nil;
    if (arrData==nil)
    {
        return str;
    }
    
    str = [arrData componentsJoinedByString:strSeparator];
    return str;
}


//时间戳转日期
+ (NSDate*)UnixTimeToDate:(long long)lTime
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lTime];
    return date;
}

//获取时间显示字符串
+ (NSString*)dateTimeAgoText:(NSString*)datelineString
{
    if (kStringIsEmpty(datelineString))
    {
        return nil;
    }
    
    NSDate* date = [ZFTool UnixTimeToDate:datelineString.longLongValue];
    return date.timeAgoSinceNow;
}


//将图片字符串转换为URL
+(NSURL *)IconStringToUrl:(NSString*)iconString
{
    if (kStringIsEmpty(iconString))
    {
        return nil;
    }
    
    NSString* str = [NSString stringWithFormat:@"%@%@",MainUrl,iconString];
    return [NSURL URLWithString:str];
}

//颜色转图片
+(UIImage*)Color2Image:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


//得到缓存大小
+(NSUInteger)getCacheSize
{
    SDImageCache * cache = [SDImageCache sharedImageCache];
    NSUInteger size = [cache getSize];
    return size;
}

/**
 清除app缓存
 */
+(void)clearAppCache
{
    SDImageCache * cache = [SDImageCache sharedImageCache];
    [cache clearDiskOnCompletion:nil];
    [cache clearMemory];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    //错误信息
    NSError *error;
    
    //清空tmp目录
    NSString* path = [ZFTool GetAppTmpPath];
    [fileMgr removeItemAtPath:path error:&error];
}

//DocumentDirectory
+(NSString*)GetAppDocPath
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return doc;
}

/**
 *  得到app的家目录下tmp目录路径，在应用退出后清空。
 *
 *  @return <#return value description#>
 */
+(NSString*)GetAppTmpPath
{
    NSString *strTmpPath = NSTemporaryDirectory();
    
    return strTmpPath;
}


//隐藏线
+(void)isHiddenNavigationBarSeparatorLine:(BOOL)hide vc:(UIViewController*)viewController
{
    if ([viewController.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        NSArray *list=viewController.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIView class]]) {
                UIView *imageView=(UIView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        if (hide)
                        {
                            imageView2.hidden = imageView2.bounds.size.height < 1;
                        }
                        else
                        {
                            imageView2.hidden = NO;
                        }
                    }
                }
            }
        }
    }
}


@end
