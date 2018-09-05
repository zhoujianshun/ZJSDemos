//
//  ZJSNormalTableViewCell.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/3.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSNormalTableViewCell.h"

#import "ZJSColorsMacros.h"
#import "ZJSTableviewMacros.h"

#import <Masonry/Masonry.h>



#define kMsgLabelTextColor RGBHEX(0x489BFF)
#define kMsgLabelFont [UIFont systemFontOfSize:14.f]

@interface ZJSNormalTableViewCell()

@property (nonatomic, strong) UIView *separateLine;

@end

@implementation ZJSNormalTableViewCell


#pragma mark - life cycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)commonInit{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    //    [self.contentView addSubview:self.accessoryImageView];
    [self.contentView addSubview:self.msgLabel];
    [self addSubview:self.separateLine];
    [self layoutPageSubviews];
}

-(void)layoutPageSubviews{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(15);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.iconImageView.mas_trailing).offset(15);
        make.trailing.lessThanOrEqualTo(self.contentView).offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
    
    //    [self.accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.leading.greaterThanOrEqualTo(self.titleLabel.mas_trailing).offset(12);
    //         make.centerY.equalTo(self.contentView);
    //        make.trailing.equalTo(self.contentView).offset(-15);
    //    }];
    
    [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(0.f);
        make.centerY.equalTo(self.contentView);
        make.leading.lessThanOrEqualTo(self.titleLabel.mas_trailing).offset(4);
    }];
    
    [self.separateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(12);
        make.bottom.equalTo(self);
        make.trailing.equalTo(self);
        make.height.equalTo(@(AS_kSeparateLineHeight));
    }];
}

#pragma mark -

-(void)updateData{
    self.iconImageView.image = [UIImage imageNamed:self.viewModel.icon];
    self.titleLabel.text = self.viewModel.title;
    self.separateLine.hidden = self.viewModel.hiddenSeparateLine;
    self.msgLabel.text = self.viewModel.message;
}

#pragma mark - getters and setters

-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15.f];
        _titleLabel.textColor = RGBHEX(0x454C56);
    }
    return _titleLabel;
}

//-(UIImageView *)accessoryImageView{
//    if (!_accessoryImageView) {
//        _accessoryImageView = [[UIImageView alloc] init];
//        _accessoryImageView.image = [UIImage imageNamed:@"icon_cell_accessory"];
//    }
//    return _accessoryImageView;
//}

-(UILabel *)msgLabel{
    if (!_msgLabel) {
        _msgLabel = [[UILabel alloc] init];
        _msgLabel.textColor = kMsgLabelTextColor;
        _msgLabel.font = kMsgLabelFont;
        _msgLabel.textAlignment = NSTextAlignmentRight;
    }
    return _msgLabel;
}


-(UIView *)separateLine{
    if (!_separateLine) {
        _separateLine  = [[UIView alloc] init];
        _separateLine.backgroundColor = AS_kSeparateLineColor;
        
    }
    return _separateLine;
}


-(void)setViewModel:(ZJSNormalTableViewCellViewModel *)viewModel{
    _viewModel = viewModel;
    [self updateData];
}

@end
