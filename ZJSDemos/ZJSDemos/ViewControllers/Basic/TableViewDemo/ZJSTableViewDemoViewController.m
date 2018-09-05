//
//  ZJSTableViewDemoViewController.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/4.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSTableViewDemoViewController.h"

#import <Masonry/Masonry.h>

#import "ZJSNormalTableViewCell.h"
#import "ZJSNormalTableViewCellViewModel.h"

#import "ZJSReferenceMacros.h"

#import "ZJSTableViewStylePlainDemoViewController.h"
#import "ZJSTableViewStyleGroupedDemoViewController.h"



#define kZJSCellIdentify  @"kZJSCellIdentify"

@interface ZJSTableViewDemoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray<ZJSTableViewCellBaseViewModel*> *datas;

@end

@implementation ZJSTableViewDemoViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadDatas];
    [self commonInit];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)commonInit{
    [self.view addSubview:self.tableView];
    
    [self layoutPageSubviews];
}
-(void)layoutPageSubviews{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}


-(void)loadDatas{
    NSMutableArray *datas = [NSMutableArray array];
    ZJSWeakObj(self)
    
    
    ZJSNormalTableViewCellViewModel *plainDemoVM = [[ZJSNormalTableViewCellViewModel alloc] init];
    plainDemoVM.title = @"UITableViewStylePlain";
    plainDemoVM.hiddenSeparateLine = YES;

    plainDemoVM.cellTappedActionBlock = ^(ZJSTableViewCellBaseViewModel *sender) {
        [weakself gotoPlainDemo];
    };
    [datas addObject:plainDemoVM];
    
    ZJSNormalTableViewCellViewModel *groupedDemoVM = [[ZJSNormalTableViewCellViewModel alloc] init];
    groupedDemoVM.title = @"UITableViewStyleGrouped";
    groupedDemoVM.hiddenSeparateLine = YES;
    groupedDemoVM.cellTappedActionBlock = ^(ZJSTableViewCellBaseViewModel *sender) {
        [weakself gotoGroupedDemo];
    };
    [datas addObject:groupedDemoVM];
    
    
    self.datas = [datas copy];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJSTableViewCellBaseViewModel *vm = [self.datas objectAtIndex:indexPath.row];
    ZJSNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kZJSCellIdentify forIndexPath:indexPath];
    cell.viewModel = (ZJSNormalTableViewCellViewModel*)vm;
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJSTableViewCellBaseViewModel *vm = [self.datas objectAtIndex:indexPath.row];
    return vm.cellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJSTableViewCellBaseViewModel *vm = [self.datas objectAtIndex:indexPath.row];
    [vm cellTappedAction];
}

#pragma mark - event response

-(void)gotoGroupedDemo{
    ZJSTableViewStyleGroupedDemoViewController *vc = [[ZJSTableViewStyleGroupedDemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)gotoPlainDemo{
    ZJSTableViewStylePlainDemoViewController *vc = [[ZJSTableViewStylePlainDemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getters and setters
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        // style 为UITableViewStylePlain的时候，tableFooterView不显示分割线
        _tableView.tableFooterView = [[UIView alloc] init];
        
        [_tableView registerClass:[ZJSNormalTableViewCell class] forCellReuseIdentifier:kZJSCellIdentify];
    }
    return _tableView;
}

@end
