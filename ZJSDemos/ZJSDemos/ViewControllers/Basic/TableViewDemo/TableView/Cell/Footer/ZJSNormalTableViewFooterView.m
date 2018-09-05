//
//  ZJSNormalTableViewFooterView.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/3.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSNormalTableViewFooterView.h"

#import <Masonry/Masonry.h>

@interface ZJSNormalTableViewFooterView()

@property (nonatomic, strong) UIView *myContentView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZJSNormalTableViewFooterView

#pragma mark - life cycle
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    [self addSubview:self.myContentView];
    [self.myContentView addSubview:self.titleLabel ];
    [self layoutPageSubViews];
}

-(void)layoutPageSubViews{
    
    [self.myContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.myContentView);
        make.leading.equalTo(self.myContentView);
    }];
    
}


#pragma mark - getters and setters

-(void)setViewModel:(ZJSNormalTableViewFooterViewModel *)viewModel{
    
    _viewModel = viewModel;
    self.titleLabel.text = self.viewModel.message;
    self.myContentView.backgroundColor = self.viewModel.backgroundColor;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

-(UIView *)myContentView{
    if (!_myContentView) {
        _myContentView = [[UIView alloc] init];
    }
    return _myContentView;
}

@end
