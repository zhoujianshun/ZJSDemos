//
//  ZJSWebViewNormalDemoViewController.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/5.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSWebViewNormalDemoViewController.h"

#import "NSString+ZJSUrlCode.h"

@interface ZJSWebViewNormalDemoViewController ()

@end

@implementation ZJSWebViewNormalDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *urlStr = @"https://www.baidu.com";
    urlStr = @"https://www.baidu.com/s?ie=utf-8&wd=开发者";
    urlStr = [urlStr URLEncodeString];
 //   urlStr = @"https://www.baidu.com/s?ie=utf-8&wd=ios%20%E7%BB%9F%E8%AE%A1%E8%80%97%E7%94%B5";
    [self loadRequestWithUrl:[NSURL URLWithString:urlStr]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
