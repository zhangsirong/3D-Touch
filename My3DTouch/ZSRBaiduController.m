//
//  ZSRBaiduController.m
//  My3DTouch
//
//  Created by zsr on 16/9/26.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ZSRBaiduController.h"

@interface ZSRBaiduController ()

@end

@implementation ZSRBaiduController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.allowsLinkPreview = YES;
    [self.view addSubview:webView];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
@end
