//
//  ZJSNormalTableViewCellViewModel.h
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/3.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSTableViewCellBaseViewModel.h"

@interface ZJSNormalTableViewCellViewModel : ZJSTableViewCellBaseViewModel

//@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *message;
@property (nonatomic) BOOL hiddenSeparateLine;

@end
