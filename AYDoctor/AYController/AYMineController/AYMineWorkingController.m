//
//  AYMineWorkingController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYMineWorkingController.h"
#import "AYReminderView.h"
#import "AYMineMainViewNormalCell.h"
#import "AYWeekSelectCell.h"
#import "AYPersonNumberPickView.h"

#define AYWEEKSELECTCELL @"AYWeekSelectCell"
#define AYNORMALCELL @"AYNormalCell"
@interface AYMineWorkingController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, assign)NSInteger amIndex;  //上午选择人数
@property (nonatomic, assign)NSInteger pmIndex;  //下午选择人数

@end

@implementation AYMineWorkingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的排班表";
    [self setupTableView];
    [self setupNaviBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedSectionHeaderHeight = 1.0f;
    self.tableView.estimatedSectionFooterHeight = 1.0f;
    self.tableView.estimatedRowHeight = 0.0f;
    [self.view addSubview:self.tableView];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 1)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footerView;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AYWeekSelectCell" bundle:nil] forCellReuseIdentifier:AYWEEKSELECTCELL];
    [self.tableView registerNib:[UINib nibWithNibName:@"AYMineMainViewNormalCell" bundle:nil] forCellReuseIdentifier:AYNORMALCELL];
}

- (void)setupNaviBar {
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveWorkingHandler:)];
    self.navigationItem.rightBarButtonItem = saveBtn;
}

#pragma mark -- UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        AYWeekSelectCell *weekSelectCell = [tableView dequeueReusableCellWithIdentifier:AYWEEKSELECTCELL forIndexPath:indexPath];
        return weekSelectCell;
        
    }else{
        AYMineMainViewNormalCell *normalCell = [tableView dequeueReusableCellWithIdentifier:AYNORMALCELL forIndexPath:indexPath];
        if(indexPath.section == 1){
            normalCell.titleLab.text = @"上午";
            normalCell.detailLab.text = (self.amIndex == 0)?@"请选择":[NSString stringWithFormat:@"%ld",self.amIndex];
        }else {
            normalCell.titleLab.text = @"下午";
            normalCell.detailLab.text = (self.pmIndex == 0)?@"请选择":[NSString stringWithFormat:@"%ld",self.pmIndex];
        }
        normalCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return normalCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        //选择上午
        [self selectPersonNumberPickViewWithAM:YES];
    }else if (indexPath.section == 2) {
        //选择下午
        [self selectPersonNumberPickViewWithAM:NO];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 313.0f;
    }else {
        return 44.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0 || section == 1){
        return 44;
    }else {
        return 15;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if(section == 0) {
        return 44.0f;
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 44)];
        backView.backgroundColor = [UIColor clearColor];
        UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 200, 20)];
        headLabel.text = @"请设定您的周排班表";
        headLabel.textColor = [UIColor blackColor];
        headLabel.font = [UIFont systemFontOfSize:14.0f];
        [backView addSubview:headLabel];
        return backView;
    }else if (section == 1) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 44)];
        backView.backgroundColor = [UIColor clearColor];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 1)];
        lineView.backgroundColor = [UIColor grayColor];
        [backView addSubview:lineView];
        UILabel *footLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 250, 20)];
        footLabel.text = @"请设定您每天的接诊人数";
        footLabel.textColor = [UIColor blackColor];
        footLabel.font = [UIFont systemFontOfSize:14.0f];
        [backView addSubview:footLabel];
        return backView;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if(section == 0) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 44)];
        backView.backgroundColor = [UIColor clearColor];
        UILabel *footLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 6, 250, 20)];
        footLabel.text = @"更新排班表不影响已成功预约的日程";
        footLabel.textColor = [UIColor blackColor];
        footLabel.font = [UIFont systemFontOfSize:14.0f];
        [backView addSubview:footLabel];
        return backView;
    }
    return nil;
}

#pragma mark -- Private Method
- (void)selectPersonNumberPickViewWithAM:(BOOL)isAM {
    AYWeakself;
    AYPersonNumberPickView *selectPickView = [AYPersonNumberPickView showOnView:self.view];
    selectPickView.frame = CGRectMake(0, DEVICEHIGHT - 300, self.view.frame.size.width, 300);
    [selectPickView setDatePickComplet:^(NSInteger selectIndex) {
        if(isAM){
            self.amIndex = selectIndex+1;
        }else {
            self.pmIndex = selectIndex+1;
        }
        [weakself.tableView reloadData];
    }];
}

#pragma mark -- 保存
- (void)saveWorkingHandler:(UIBarButtonItem *)sender {
    
}

@end
