//
//  ZJSTableViewStyleGroupedDemoViewController.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/5.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "ZJSTableViewStyleGroupedDemoViewController.h"

#import <Masonry/Masonry.h>

#import "ZJSReferenceMacros.h"

#import "ZJSNormalTableViewCell.h"
#import "ZJSNormalTableViewCellViewModel.h"
#import "ZJSTableViewGroupBaseModel.h"
#import "ZJSNormalTableViewFooterView.h"
#import "ZJSNormalTableViewFooterViewModel.h"
#import "ZJSNormalTableViewHeaderView.h"
#import "ZJSNormalTableViewHeaderViewModel.h"


NSString* const kGroupedDemoCellIdentify = @"kGroupedDemoCellidentify";
NSString* const kGroupedDemoHeaderIdentify = @"kGroupedDemoHeaderIdentify";
NSString* const kGroupedDemoFootorIdentify = @"kGroupedDemoHeaderIdentify";

@interface ZJSTableViewStyleGroupedDemoViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *groups;



@end

@implementation ZJSTableViewStyleGroupedDemoViewController

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
    NSMutableArray *groups = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        ZJSTableViewGroupBaseModel *group = [[ZJSTableViewGroupBaseModel alloc] init];
        
        ZJSNormalTableViewHeaderViewModel *header = [[ZJSNormalTableViewHeaderViewModel alloc] init];
        header.headerHeight = 60;
        header.title = [NSString stringWithFormat:@"group %@ header", @(i)];
        header.message = [NSString stringWithFormat:@"group %@ header message", @(i)];
        header.backgroundColor = [UIColor redColor];
        group.headerViewModel = header;
        
        ZJSNormalTableViewFooterViewModel *footor = [[ZJSNormalTableViewFooterViewModel alloc] init];
        footor.footerHeight = 40;
        footor.message = [NSString stringWithFormat:@"group %@ footor message", @(i)];
        footor.backgroundColor = [UIColor purpleColor];
        group.footerViewModel = footor;
        
        NSMutableArray *vms = [NSMutableArray array];
        for (int j = 0; j<5; j++) {
            ZJSNormalTableViewCellViewModel *viewModel = [[ZJSNormalTableViewCellViewModel alloc] init];
            viewModel.title = [NSString stringWithFormat:@"cell item at(%@, %@)", @(i), @(j) ];
            viewModel.cellHeight = 44.f;
            [vms addObject:viewModel];
        }
        group.datas = [vms copy];
        
        [groups addObject:group];
    }
    
    self.groups = groups;
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZJSTableViewGroupBaseModel *group = [self.groups objectAtIndex:section];
    return group.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJSTableViewGroupBaseModel *group = [self.groups objectAtIndex:indexPath.section];
    ZJSTableViewCellBaseViewModel *vm = [group.datas objectAtIndex:indexPath.row];
    
    // return cell
    ZJSNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kGroupedDemoCellIdentify forIndexPath:indexPath];
    cell.viewModel = (ZJSNormalTableViewCellViewModel*)vm;
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJSTableViewGroupBaseModel *group = [self.groups objectAtIndex:indexPath.section];
    ZJSTableViewCellBaseViewModel *vm = [group.datas objectAtIndex:indexPath.row];
    
    return vm.cellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    ZJSTableViewGroupBaseModel *group = [self.groups objectAtIndex:section];
    return group.headerHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    ZJSTableViewGroupBaseModel *group = [self.groups objectAtIndex:section];
    return group.footerHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJSTableViewGroupBaseModel *group = [self.groups objectAtIndex:indexPath.section];
    ZJSTableViewCellBaseViewModel *vm = [group.datas objectAtIndex:indexPath.row];
    [vm cellTappedAction];
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZJSNormalTableViewHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kGroupedDemoHeaderIdentify];
    ZJSTableViewGroupBaseModel *group = [self.groups objectAtIndex:section];
    header.viewModel = (ZJSNormalTableViewHeaderViewModel*)group.headerViewModel;
    return header;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    ZJSNormalTableViewFooterView *footorView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kGroupedDemoFootorIdentify];
    ZJSTableViewGroupBaseModel *group = [self.groups objectAtIndex:section];
    footorView.viewModel = (ZJSNormalTableViewFooterViewModel*)group.footerViewModel;
    return footorView;
}
#pragma mark - getters and setters
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        
        
        [_tableView registerClass:[ZJSNormalTableViewCell class] forCellReuseIdentifier:kGroupedDemoCellIdentify];
        [_tableView registerClass:[ZJSNormalTableViewHeaderView class] forHeaderFooterViewReuseIdentifier:kGroupedDemoHeaderIdentify];
        [_tableView registerClass:[ZJSNormalTableViewFooterView class] forHeaderFooterViewReuseIdentifier:kGroupedDemoFootorIdentify];
    }
    return _tableView;
}

@end
