//
//  Global.h
//  InvestmentAndFinancingSystem
//
//  Created by ppan on 2017/5/12.
//  Copyright © 2017年 ppan. All rights reserved.
//

#ifndef Global_h
#define Global_h

/* Check */
#define NOT_NULL(_instance) (_instance&&![_instance isKindOfClass:[NSNull class]])
#define CHECK_NULL_DATA_STRING(string) NOT_NULL(string) ? [NSString stringWithFormat:@"%@",string] : @""

#define RRColor(r, g, b, al) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:al]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define DSHexColor(hex)     [UIColor colorWithHexString:hex]
//#define DSLocalString(string) NSLocalizedString(string,nil)

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0f ? YES : NO)
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0f ? YES : NO)

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kKeyWindow [UIApplication sharedApplication].keyWindow

#define RRScreenWith    [UIScreen mainScreen].bounds.size.width
#define RRScreenHeight  [UIScreen mainScreen].bounds.size.height
#define RRIOSUIDevice   [[[UIDevice currentDevice] systemVersion] floatValue]
#define DSImageName(a)  [UIImage imageNamed:a]
#define KeyWindow       [UIApplication sharedApplication].keyWindow
#define kIsPlus         [UIScreen mainScreen].bounds.size.width == 414.0f

#define RRBaseColor     DSHexColor(@"#099fdc")
#define SPScaleNumber   RRScreenWith/640
#endif /* Global_h */
