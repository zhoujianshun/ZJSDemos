//
//  ZJSNormalTableViewCell.h
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/3.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ZJSNormalTableViewCellViewModel.h"

@interface ZJSNormalTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
//@property (nonatomic, strong) UIImageView *accessoryImageView;
@property (nonatomic, strong) UILabel *msgLabel;

@property (nonatomic, strong) ZJSNormalTableViewCellViewModel *viewModel;

@end
