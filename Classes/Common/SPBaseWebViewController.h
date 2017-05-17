//
//  DSBaseWebViewController.h
//  DSCancer
//
//  Created by ppan on 15/10/28.
//  Copyright © 2015年 manito. All rights reserved.
//

#import "SPBaseViewController.h"

@interface SPBaseWebViewController : SPBaseViewController
@property (nonatomic, strong ) UIWebView *myWebView;
@property (nonatomic, strong ) NSString  *webUrlStr;
@property (nonatomic, strong ) NSString  *titleStr;
@end
