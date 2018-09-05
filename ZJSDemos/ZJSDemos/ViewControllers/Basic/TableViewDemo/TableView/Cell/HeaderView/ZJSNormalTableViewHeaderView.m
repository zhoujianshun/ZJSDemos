//
//  ZJSNormalTableViewHeaderView.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/3.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSNormalTableViewHeaderView.h"

@implementation ZJSNormalTableViewHeaderView

-(void)setViewModel:(ZJSNormalTableViewHeaderViewModel *)viewModel{
    
    _viewModel = viewModel;
    self.textLabel.text = self.viewModel.message;
}

@end
