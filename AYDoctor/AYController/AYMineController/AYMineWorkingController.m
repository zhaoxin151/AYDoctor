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
    [self setupTableView];
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
        return 80.0f;
    }else {
        return 44.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0 || section == 1){
        return 44;
    }else {
        return 20;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if(section == 0) {
        return 44.0f;
    }
    return 1;
}

#pragma mark -- Private Method
- (void)selectPersonNumberPickViewWithAM:(BOOL)isAM {
    AYWeakself;
    AYPersonNumberPickView *selectPickView = [AYPersonNumberPickView showOnView:self.view];
    selectPickView.frame = CGRectMake(0, DEVICEHIGHT - 300, self.view.frame.size.width, 300);
    [selectPickView setDatePickComplet:^(NSInteger selectIndex) {
        if(isAM){
            self.amIndex = selectIndex;
        }else {
            self.pmIndex = selectIndex;
        }
        [weakself.tableView reloadData];
    }];
}

@end
