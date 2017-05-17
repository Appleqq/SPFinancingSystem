//
//  DSBaseWebViewController.m
//  DSCancer
//
//  Created by ppan on 15/10/28.
//  Copyright © 2015年 manito. All rights reserved.
//

#import "SPBaseWebViewController.h"

@interface SPBaseWebViewController ()<UIWebViewDelegate>

@end

@implementation SPBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _titleStr;
}

- (void)createUI {

    _myWebView = [UIWebView newAutoLayoutView];
    [self.view addSubview:_myWebView];
    _myWebView.delegate = self;
    [_myWebView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];

}

- (void)createData {
    [self createNewUIWithUrl:_webUrlStr];
}
- (void)createNewUIWithUrl:(NSString *)url {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_myWebView loadRequest:request];
}
#pragma -mark web delegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
//    [MBProgressHUD showWindowMessageThenHide:@"正在加载"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
   
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
//    [MBProgressHUD showWindowErrorThenHide:error.localizedDescription];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
