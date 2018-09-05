//
//  ZJSNormalTableViewCellViewModel.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/3.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSNormalTableViewCellViewModel.h"

@implementation ZJSNormalTableViewCellViewModel

@synthesize cellHeight = _cellHeight;

-(instancetype)init{
    self = [super init];
    if (self) {
        _cellHeight = 44;
    }
    return self;
}

@end
