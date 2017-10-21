//
//  AYMineInfoController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYMineInfoController.h"
#import "AYMineMainViewAvataCell.h"
#import "AYMineMainViewNormalCell.h"
#import "AYMineMainViewInputCell.h"

#define AYMAINAVATACELL @"mainAvataCell"
#define AYMAINNORMALCELL @"mainNomalCell"
#define AYMAININPUTECELL @"mainInputCell"
#define AYUSERINFOARR @[@[@"头像"],@[@"姓名"],@[@"医院",@"科室",@"职称",@"从业年限"],@[@"就诊地点"],@[@"擅长"]]
#define AYUSERINFTITLEARR @[@[@"头像"],@[@"姓名"],@[@"医院",@"科室",@"职称",@"从业年限"],@[@"就诊地点"],@[@"擅长"]]
@interface AYMineInfoController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation AYMineInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人主页";
    //保存按钮
    [self setupNaviBar];
    //创建tableView
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNaviBar {
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveUserInfoHandler:)];
    self.navigationItem.rightBarButtonItem = saveBtn;
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedSectionHeaderHeight = 1.0f;
    self.tableView.estimatedRowHeight = 0.0f;
    [self.view addSubview:self.tableView];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, DEVICEWIDTH, 100)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footerView;
    UIButton *preViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, DEVICEWIDTH-40, 40)];
    preViewBtn.backgroundColor = naviBarAndButtonColor;
    preViewBtn.tintColor = [UIColor whiteColor];
    [preViewBtn setTitle:@"预览" forState:UIControlStateNormal];
    [preViewBtn addTarget:self action:@selector(preViewBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    preViewBtn.layer.masksToBounds = YES;
    preViewBtn.layer.cornerRadius = 6.0f;
    [footerView addSubview:preViewBtn];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AYMineMainViewAvataCell" bundle:nil] forCellReuseIdentifier:AYMAINAVATACELL];
    [self.tableView registerNib:[UINib nibWithNibName:@"AYMineMainViewNormalCell" bundle:nil] forCellReuseIdentifier:AYMAINNORMALCELL];
    [self.tableView registerNib:[UINib nibWithNibName:@"AYMineMainViewInputCell" bundle:nil] forCellReuseIdentifier:AYMAININPUTECELL];
}

#pragma mark -- UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return AYUSERINFOARR.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [AYUSERINFOARR[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        AYMineMainViewAvataCell *avataCell = [tableView dequeueReusableCellWithIdentifier:AYMAINAVATACELL forIndexPath:indexPath];
        return avataCell;
    }else if (indexPath.section == 1 || indexPath.section == 2){
        AYMineMainViewNormalCell *normalCell = [tableView dequeueReusableCellWithIdentifier:AYMAINNORMALCELL forIndexPath:indexPath];
        normalCell.titleLab.text = AYUSERINFOARR[indexPath.section][indexPath.row];
        return normalCell;
    }else if (indexPath.section == 3 || indexPath.section == 4) {
        AYMineMainViewInputCell *inputCell = [tableView dequeueReusableCellWithIdentifier:AYMAININPUTECELL forIndexPath:indexPath];
        inputCell.titleLab.text = AYUSERINFOARR[indexPath.section][indexPath.row];
        return inputCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 70.0f;
    }else if (indexPath.section == 3 || indexPath.section == 4){
        return 110.0f;
    }else {
        return 44.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section < 3){
        return 15;
    }else {
        return 30;
    }
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark -- @Selctor
//预览按钮被按下
- (void)preViewBtnHandler:(UIButton *)sender {
    
}

//保存按钮被按下
- (void)saveUserInfoHandler:(UIBarButtonItem *)item {
    
}
@end
