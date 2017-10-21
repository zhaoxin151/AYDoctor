//
//  AYMineController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/20.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYMineController.h"
#import "AYMineInfoCell.h"
#import "AYMineWoringCell.h"
#import "AYMineInfoController.h"
#import "AYMineWorkingController.h"
#import "AYChangPwdController.h"
#import "AYAboutUsController.h"

#define MINEINFOCELL @"myinfoCell"
#define MINEWORKINGCELL @"myWorkingCell"
@interface AYMineController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, AYMineWorkingCellDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation AYMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的";
    // 1.set up TableView
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
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, DEVICEWIDTH, 200)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footerView;
    UIButton *logOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, DEVICEWIDTH-40, 40)];
    logOutBtn.backgroundColor = naviBarAndButtonColor;
    logOutBtn.tintColor = [UIColor whiteColor];
    [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logOutBtn addTarget:self action:@selector(logOutBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    logOutBtn.layer.masksToBounds = YES;
    logOutBtn.layer.cornerRadius = 6.0f;
    [footerView addSubview:logOutBtn];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AYMineInfoCell" bundle:nil] forCellReuseIdentifier:MINEINFOCELL];
    [self.tableView registerNib:[UINib nibWithNibName:@"AYMineWoringCell" bundle:nil] forCellReuseIdentifier:MINEWORKINGCELL];
}

//退出登录被按下
- (void)logOutBtnHandler:(UIButton *)btn {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"确认退出？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}

#pragma mark -- UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        AYMineInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:MINEINFOCELL forIndexPath:indexPath];
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return infoCell;
    }else if (indexPath.section == 1){
        AYMineWoringCell *workCell = [tableView dequeueReusableCellWithIdentifier:MINEWORKINGCELL forIndexPath:indexPath];
        workCell.selectionStyle = UITableViewCellSelectionStyleNone;
        workCell.delegate = self;
        return workCell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if(indexPath.section == 2){
        cell.textLabel.text = @"修改密码";
    }else {
        cell.textLabel.text = @"关于我们";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        //跳转到个人主页
        AYMineInfoController *mineInfoVC = [[AYMineInfoController alloc] init];
        [self.navigationController pushViewController:mineInfoVC animated:YES];
    }else if (indexPath.section == 2) {
        //修改密码
        AYChangPwdController *changPwdVC = [[AYChangPwdController alloc] init];
        [self.navigationController pushViewController:changPwdVC animated:YES];
    }else if (indexPath.section == 3) {
        //关于我们
        AYAboutUsController *aboutUsVC = [[AYAboutUsController alloc] init];
        [self.navigationController pushViewController:aboutUsVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 80.0f;
    }else if (indexPath.section == 1) {
        return 60.0f;
    }else {
        return 44.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.f;
}

#pragma mark -- UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        //确认退出
        [g_App goLoginVC];
    }
}

#pragma mark -- AYMineWorkingCellDelegate
//我的主页按钮点击事件
- (void)myInfoBtnHandler:(UIButton *)btn {
    AYMineInfoController *mineInfoVC = [[AYMineInfoController alloc] init];
    [self.navigationController pushViewController:mineInfoVC animated:YES];
}

//我的日程表按钮点击事件
- (void)myWorkingBtnHandler:(UIButton *)btn {
    AYMineWorkingController *myWorkVC = [[AYMineWorkingController alloc] init];
    [self.navigationController pushViewController:myWorkVC animated:YES];
}

@end
