//
//  ZJSBasicViewController.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/8/30.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSBasicViewController.h"

#import <Masonry/Masonry.h>

#import "ZJSNormalTableViewCell.h"
#import "ZJSNormalTableViewCellViewModel.h"

#import "ZJSReferenceMacros.h"

#import "ZJSTableViewDemoViewController.h"



NSString* const kZJSCellIdentify = @"kZJSCellIdentify";

@interface ZJSBasicViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray<ZJSTableViewCellBaseViewModel*> *datas;

@end

@implementation ZJSBasicViewController

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
    
    ZJSNormalTableViewCellViewModel *tableViewDemoVM = [[ZJSNormalTableViewCellViewModel alloc] init];
    tableViewDemoVM.title = @"UITableView Demo";
    tableViewDemoVM.hiddenSeparateLine = YES;
    
    ZJSWeakObj(self)
    tableViewDemoVM.cellTappedActionBlock = ^(ZJSTableViewCellBaseViewModel *sender) {
        [weakself gotoTableViewDemo];
    };
    [datas addObject:tableViewDemoVM];
    
    
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

-(void)gotoTableViewDemo{
    ZJSTableViewDemoViewController *vc = [[ZJSTableViewDemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getters and setters
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        
        [_tableView registerClass:[ZJSNormalTableViewCell class] forCellReuseIdentifier:kZJSCellIdentify];
    }
    return _tableView;
}

@end
