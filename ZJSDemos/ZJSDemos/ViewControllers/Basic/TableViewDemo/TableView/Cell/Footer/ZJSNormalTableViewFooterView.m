//
//  ZJSNormalTableViewFooterView.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/3.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSNormalTableViewFooterView.h"

@interface ZJSNormalTableViewFooterView()


@end

@implementation ZJSNormalTableViewFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setViewModel:(ZJSNormalTableViewFooterViewModel *)viewModel{
    
    _viewModel = viewModel;
    self.textLabel.text = self.viewModel.message;
}

@end
