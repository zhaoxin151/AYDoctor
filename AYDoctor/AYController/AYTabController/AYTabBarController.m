//
//  AYTabBarControllerViewController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYTabBarController.h"
#import "AYMainController.h"
#import "AYScheduleController.h"
#import "AYMineController.h"

@interface AYTabBarController ()

@property (nonatomic, strong)UINavigationController *navC1;
@property (nonatomic, strong)UINavigationController *navC2;
@property (nonatomic, strong)UINavigationController *navC3;

@property (nonatomic, strong)AYMainController *mainVC;
@property (nonatomic, strong)AYScheduleController *scheduleVC;
@property (nonatomic, strong)AYMineController *mineVC;

@end

@implementation AYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainVC      = [[AYMainController alloc] init];
    _scheduleVC  = [[AYScheduleController alloc] init];
    _mineVC      = [[AYMineController alloc] init];
    
    _navC1 = [[UINavigationController alloc] initWithRootViewController:_mainVC];
    _navC2 = [[UINavigationController alloc] initWithRootViewController:_scheduleVC];
    _navC3 = [[UINavigationController alloc] initWithRootViewController:_mineVC];
              
    _mainVC.title      = @"首页";
    _scheduleVC.title  = @"日程";
    _mineVC.title      = @"我的";
    
    self.tabBar.tintColor = naviBarAndButtonColor;
    _mainVC.tabBarItem.image = [[UIImage imageNamed:@"AY_TabBar_Main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _scheduleVC.tabBarItem.image = [[UIImage imageNamed:@"AY_TabBar_Schedule"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    _mineVC.tabBarItem.image = [[UIImage imageNamed:@"AY_TabBar_Mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _mainVC.tabBarItem.selectedImage = [[[UIImage imageNamed:@"AY_TabBar_Main_on"] changeImageColor:naviBarAndButtonColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _scheduleVC.tabBarItem.selectedImage = [[[UIImage imageNamed:@"AY_TabBar_Schedule_on"] changeImageColor:naviBarAndButtonColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _mineVC.tabBarItem.selectedImage = [[[UIImage imageNamed:@"AY_TabBar_Mine_on"] changeImageColor:naviBarAndButtonColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:_navC1];
    [self addChildViewController:_navC2];
    [self addChildViewController:_navC3];
    
}

-(void)setIndex:(NSInteger)index
{
    self.selectedIndex = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
