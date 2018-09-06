//
//  ZJSNaviBarHideDemoViewController.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/6.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSNaviBarHideDemoViewController.h"

#import <Masonry/Masonry.h>

#import "ZJSNaviBarHideDemoNextViewController.h"

@interface ZJSNaviBarHideDemoViewController ()

@end

@implementation ZJSNaviBarHideDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - getters and setters

- (IBAction)nextAction:(id)sender {
    ZJSNaviBarHideDemoNextViewController *vc = [[ZJSNaviBarHideDemoNextViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
