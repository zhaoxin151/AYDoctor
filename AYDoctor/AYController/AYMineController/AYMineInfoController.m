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
#import "AYMineSpecialityController.h"
#import "AYSelectPickView.h"

#define AYMAINAVATACELL @"mainAvataCell"
#define AYMAINNORMALCELL @"mainNomalCell"
#define AYMAININPUTECELL @"mainInputCell"
#define AYUSERINFOARR @[@[@"头像"],@[@"姓名"],@[@"医院",@"科室",@"职称",@"从业年限"],@[@"就诊地点"],@[@"擅长"],@[@"简介"]]
#define AYUSERINFTITLEARR @[@[@"头像"],@[@"姓名"],@[@"医院",@"科室",@"职称",@"从业年限"],@[@"就诊地点"],@[@"擅长"],@[@"简介"]]
#define AYJOBARRAY @[@"住院医师", @"主治医师", @"副主任医师", @"主任医师"]
@interface AYMineInfoController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, assign)NSInteger jobIndex; //职称选择索引
@property (nonatomic, assign)NSInteger jobYearIndex; //从业年限索引

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
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 1)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footerView;
    
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
        if(indexPath.section == 2) {
            if(indexPath.row == 2){
                normalCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                normalCell.detailLab.text = (self.jobIndex == 0)?@"请选择":AYJOBARRAY[self.jobIndex-1];
            }else if (indexPath.row == 3) {
                normalCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                normalCell.detailLab.text = (self.jobYearIndex == 0)?@"请选择":AYYEARARRAY[self.jobYearIndex-1];
            }
        }
        return normalCell;
    }else if (indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5) {
        AYMineMainViewInputCell *inputCell = [tableView dequeueReusableCellWithIdentifier:AYMAININPUTECELL forIndexPath:indexPath];
        inputCell.titleLab.text = AYUSERINFOARR[indexPath.section][indexPath.row];
        inputCell.textViewTag = indexPath.section - 2;
        [inputCell setTextViewEndEditing:^(NSString *text, NSInteger textViewTag) {
            //输入的回调
            if(textViewTag == 1) {
                //地址
            }else if (textViewTag == 2) {
                //擅长
            }else if (textViewTag == 3) {
                //简介
            }
        }];
        return inputCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        //选择头像
        UIActionSheet *sheetAction = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"退出" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"相册", nil];
        sheetAction.tag = 1;
        [sheetAction showInView:self.view];
    }else if (indexPath.section == 2 && indexPath.row == 2) {
        //选择职称
        UIActionSheet *sheetAction = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"退出" destructiveButtonTitle:nil otherButtonTitles:@"住院医师", @"主治医师", @"副主任医师", @"主任医师", nil];
        sheetAction.tag = 2;
        [sheetAction showInView:self.view];
    }else if (indexPath.section == 2 && indexPath.row == 3) {
        //选择从业年限
        [self selectJobYear];
    }else if (indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5) {
        //跳转到输入就诊地点，擅长，简介
        AYMineSpecialityController *specialityVC = [[AYMineSpecialityController alloc] initWithNibName:@"AYMineSpecialityController" bundle:nil];
        [self.navigationController pushViewController:specialityVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 70.0f;
    }else if (indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5){
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


#pragma mark -- UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(actionSheet.tag == 1) {
        //选择头像
        if(buttonIndex == 0) {
            //拍照
            [self selectHeadImage:NO];
        }else if (buttonIndex == 1) {
            //相册
            [self selectHeadImage:YES];
        }
    }else if (actionSheet.tag == 2) {
        //选择医师
        if(buttonIndex < 4){
            self.jobIndex = buttonIndex + 1;
            [self.tableView reloadData];
        }
    }
}

#pragma mark -  用户获取活动图片 相册||摄像头
- (void)selectHeadImage:(BOOL)isCamera
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = isCamera ? UIImagePickerControllerSourceTypePhotoLibrary :UIImagePickerControllerSourceTypeCamera ;
    
    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:^{   }];
}


#pragma mark - UIImagePickerControllerDelegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *defaultImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    UIImage *newImage = [UIImage rotate90:defaultImage];
//    [_headCell.headImage setImage:newImage];
    
    /**
     *  在此处，上传头像
     */
//    NTWeakself;
//    NSDictionary *dic = @{@"token":g_loginUser.token};
//    [NTServiceShell UploadHeadImage:dic image:newImage completion:^(NSDictionary *responseObject) {
//        NTLog(@"%@",dic);
//        [weakself.headCell.headImage nt_updateAvatorWithUserId:g_loginUser.userId WithImageType:0 withHolderImage:nil isUpdate:YES];
//        self.updateAvata();
//    } withError:^(NSString *error) {
//        NTLog(@"%@",error);
//    }];
    
    [self dismissViewControllerAnimated:YES completion:^{  }];
}

#pragma mark -- 选择就业年限
- (void)selectJobYear {
    AYWeakself;
    AYSelectPickView *selectPickView = [AYSelectPickView showOnView:self.view];
    selectPickView.frame = CGRectMake(0, DEVICEHIGHT - 300, self.view.frame.size.width, 300);
    [selectPickView setDatePickComplet:^(NSInteger selectIndex) {
        weakself.jobYearIndex = selectIndex+1;
        [weakself.tableView reloadData];
    }];
}

#pragma mark -- @Selctor
//保存按钮被按下
- (void)saveUserInfoHandler:(UIBarButtonItem *)item {
    
}
@end
