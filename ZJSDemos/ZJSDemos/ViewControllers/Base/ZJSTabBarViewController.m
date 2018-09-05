//
//  ZJSTabBarViewController.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/8/30.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSTabBarViewController.h"

#import "ZJSNavigationController.h"
#import "ZJSUtilityViewController.h"
#import "ZJSBasicViewController.h"


@interface ZJSTabBarViewController ()

@end

@implementation ZJSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initControllers{
    ZJSBasicViewController *basic = [[ZJSBasicViewController alloc] init];
    ZJSNavigationController *basicNavi = [[ZJSNavigationController alloc] initWithRootViewController:basic];
    basicNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Basic" image:nil tag:1];
    
    
    ZJSUtilityViewController *utility = [[ZJSUtilityViewController alloc] init];
    ZJSNavigationController *utilityNavi = [[ZJSNavigationController alloc] initWithRootViewController:utility];
    utilityNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Utility" image:nil tag:1];
    
    self.viewControllers = @[basicNavi, utilityNavi];
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
