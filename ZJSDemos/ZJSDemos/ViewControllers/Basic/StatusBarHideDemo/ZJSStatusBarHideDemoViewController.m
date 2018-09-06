//
//  ZJSStatusBarHideDemoViewController.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/6.
//  Copyright © 2018年 周建顺. All rights reserved.
//


// 参考文章
// https://www.jianshu.com/p/4196d7cf95f4
#import "ZJSStatusBarHideDemoViewController.h"

@interface ZJSStatusBarHideDemoViewController ()

@property (nonatomic, assign) BOOL statusBarHidden;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (weak, nonatomic) IBOutlet UILabel *statusBarHiddenLabel;

@end

@implementation ZJSStatusBarHideDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateStatusBarLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)prefersStatusBarHidden{
    return self.statusBarHidden;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return self.statusBarStyle;
}


/**
 statusbar 过度动画

 @return <#return value description#>
 */
-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationFade;
}

- (IBAction)statusBarHiddenValueChanged:(UISwitch*)sender {
    
    self.statusBarHidden = !sender.isOn;
    [self setNeedsStatusBarAppearanceUpdate];
    [self updateStatusBarLabel];
}

-(void)updateStatusBarLabel{
    if (self.statusBarHidden) {
        self.statusBarHiddenLabel.text = @"状态栏隐藏";
    }else{
        self.statusBarHiddenLabel.text = @"状态栏显示";
    }
}

- (IBAction)statusBarStyleChangedAction:(UISwitch *)sender {
    // 当前界面statusBar style的改变需要配合ZJSNavigationController，重写遗下两个方法
    //-(UIViewController *)childViewControllerForStatusBarHidden{
    //-(UIViewController *)childViewControllerForStatusBarStyle{

    if (sender.isOn) {
        self.statusBarStyle = UIStatusBarStyleDefault;
    }else{
        self.statusBarStyle = UIStatusBarStyleLightContent;
    }
    [self setNeedsStatusBarAppearanceUpdate];
}

@end
