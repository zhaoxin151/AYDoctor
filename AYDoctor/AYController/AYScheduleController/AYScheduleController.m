//
//  AYScheduleController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/20.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYScheduleController.h"
#import "AYScheduleCalendarCell.h"
#import "AYPatientCell.h"
#import "AYPatientDetailController.h"

#define PATIENTCELL     @"patientCell"
#define SCHEDULECALENDARCELL @"scheduleCalendarCell"
@interface AYScheduleController ()<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating, AYScheduleCalendarCellDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic , strong)NSMutableArray *searchResult;
@property (nonatomic , strong)UISearchController *searchController;

@end

@implementation AYScheduleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"日程";
    
    [self setupTableView];
    [self setUpSearchBar];
}

-(void)viewWillDisappear:(BOOL)animated
{
    //取消识别
    [super viewWillDisappear:animated];
    if (self.searchController.active) {
        self.searchController.active = NO;
        [self.searchController.searchBar removeFromSuperview];
    }
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
    
    [self.tableView registerClass:[AYScheduleCalendarCell class] forCellReuseIdentifier:SCHEDULECALENDARCELL];
    [self.tableView registerNib:[UINib nibWithNibName:@"AYPatientCell" bundle:nil] forCellReuseIdentifier:PATIENTCELL];
    
}

-(void)setUpSearchBar
{
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = false;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.backgroundColor = [UIColor whiteColor];
    self.searchController.searchBar.barTintColor = [UIColor groupTableViewBackgroundColor];
    [self.searchController.searchBar setPlaceholder:@"按姓名/预约识别码搜索患者"];
    UITextField * searchField = [self.searchController.searchBar valueForKey:@"_searchField"];
    [searchField setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    
#if 0
    if ([self.searchController.searchBar respondsToSelector:@selector(barTintColor)]) {
        if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.1) {
            //ios7.1
            [[[[self.searchController.searchBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
            [self.searchController.searchBar setBackgroundColor:[UIColor clearColor]];
        }else{
            //ios7.0
            [self.searchController.searchBar setBarTintColor:[UIColor clearColor]];
            [self.searchController.searchBar setBackgroundColor:[UIColor clearColor]];
        }
    }else{
        //iOS7.0 以下
        [[self.searchController.searchBar.subviews objectAtIndex:0] removeFromSuperview];
        [self.searchController.searchBar setBackgroundColor:[UIColor clearColor]];
    }
#endif
}

#pragma mark -- UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 1;
    }else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        AYScheduleCalendarCell *calendarCell = [tableView dequeueReusableCellWithIdentifier:SCHEDULECALENDARCELL forIndexPath:indexPath];
        calendarCell.delegate = self;
        calendarCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return calendarCell;
    }else {
        AYPatientCell *patientCell = [tableView dequeueReusableCellWithIdentifier:PATIENTCELL forIndexPath:indexPath];
        return patientCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 1) {
        //患者信息
        AYPatientDetailController *patientDetailCR = [[AYPatientDetailController alloc] init];
        patientDetailCR.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:patientDetailCR animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 300.0f;
    }else {
        return 66.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 1) {
        return 10;
    }
    return 0.1f;
}

#pragma mark -- AYScheduleCalendarCellDelegate
- (void)scheduleCanlendarSelectDayWithTimeInterval:(NSTimeInterval)dateInterval {
    //选择的时间
}

#pragma mark -- UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *inputStr = searchController.searchBar.text;
    if(inputStr.length == 0)
    {
        [self.searchResult removeAllObjects];
    }
}



-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.searchController.searchBar setPlaceholder:@"按姓名/预约识别码搜索患者"];
    self.searchController.searchBar.showsCancelButton = YES;
    for(UIView *view in  [[[self.searchController.searchBar subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
        }
    }
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
}


#pragma mark -- SearchBarDelegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //    NTLog(@"点击搜索:%@",searchBar.text);
    [self searchUserByInput:searchBar.text pageIndex:0];
}

///根据输入查询
-(void)searchUserByInput:(NSString *)searchText pageIndex:(NSInteger)pageIndex
{
    [HUDNotificationCenter showLoading:@"努力加载中..." forBackView:self.view];
    //    NSDictionary *params = @{@"key":searchText,@"access_token":g_loginUser.token,@"pageIndex":pageNumber,@"pageSize":@15};
    //    [NTServiceShell searchUserFromServer:params completion:^(NSArray * response) {
    //        NTStrongself;
    //        [HUDNotificationCenter hideLoading:strongself.view];
    //    } withError:^(NSString *msgError) {
    //        [HUDNotificationCenter hideLoading:self.view];
    //        [HUDNotificationCenter showMessage:msgError hideAfter:2.0f];
    //    }];
}

#pragma mark -- getter -setter
- (NSMutableArray *)searchResult{
    if(!_searchResult){
        _searchResult = [[NSMutableArray alloc] init];
    }
    return _searchResult;
}
@end
