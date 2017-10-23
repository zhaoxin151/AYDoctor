//
//  AYPatientDetailController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/23.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYPatientDetailController.h"

@interface AYPatientDetailController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic , strong) UITableView *tableView;

@end

@implementation AYPatientDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"患者主页";
    
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
}

#pragma mark -- UITableViewDelegate
#pragma mark -- UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

@end
