//
//  AYUnWritePatientController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/23.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYUnWritePatientController.h"
#import "AYPatientCell.h"
#import "AYPatientDetailController.h"

#define PATIENTCELL     @"patientCell"
@interface AYUnWritePatientController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@end

@implementation AYUnWritePatientController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"未填写就诊结果的患者";
    
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedSectionHeaderHeight = 1.0f;
    self.tableView.estimatedRowHeight = 0.0f;
    [self.view addSubview:self.tableView];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 1)];
    self.tableView.tableFooterView = footerView;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AYPatientCell" bundle:nil] forCellReuseIdentifier:PATIENTCELL];
}

#pragma mark -- UITableViewDelegate
#pragma mark -- UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AYPatientCell *patientCell = [tableView dequeueReusableCellWithIdentifier:PATIENTCELL forIndexPath:indexPath];
    return patientCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //患者信息
    AYPatientDetailController *patientDetailCR = [[AYPatientDetailController alloc] init];
    patientDetailCR.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:patientDetailCR animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 44)];
    backView.backgroundColor = [UIColor whiteColor];
    
    UIView *toplineView = [[UIView alloc] initWithFrame:CGRectMake(15.0f, 0, DEVICEWIDTH-15, 1)];
    toplineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [backView addSubview:toplineView];
    
    UILabel *timeLab = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 20, 200, 20)];
    timeLab.textColor = [UIColor blackColor];
    timeLab.font = [UIFont systemFontOfSize:15.0f];
    if(section == 0) {
        timeLab.text = @"2017-11-01";
    } else {
        timeLab.text = @"2017-11-03";
    }
    [backView addSubview:timeLab];
    
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(15.0f, 43, DEVICEWIDTH-15, 1)];
    bottomLineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [backView addSubview:bottomLineView];
    return backView;
}

@end
