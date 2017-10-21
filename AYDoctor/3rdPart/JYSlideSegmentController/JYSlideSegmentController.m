//
//  JYSlideSegmentController.m
//  JYSlideSegmentController
//
//  Created by Alvin on 14-3-16.
//  Copyright (c) 2014年 Alvin. All rights reserved.
//

#import "JYSlideSegmentController.h"

#define SEGMENT_BAR_HEIGHT 44
#define INDICATOR_HEIGHT 3

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

NSString * const segmentBarItemID = @"JYSegmentBarItem";

@interface JYSegmentBarItem : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation JYSegmentBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self addDoubleClickGuesture];
    }
    return self;
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _titleLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

#pragma DoubleClick Extension for slideSegmentController
- (void)addDoubleClickGuesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired = 2;
    [self.contentView addGestureRecognizer:tapGesture];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSDictionary *userInfo = @{ @"NTDoubleClickEventVCTitle": self.titleLabel.text };
        [notificationCenter postNotificationName:@"com.naton.JYSlideSegmentController.JYSegmentBarItem" object:nil userInfo:userInfo];
    }
}

@end

@interface JYSlideSegmentController ()
<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong, readwrite) UICollectionView *segmentBar;
@property (nonatomic, strong, readwrite) UIScrollView *slideView;
//@property (nonatomic, assign, readwrite) NSInteger selectedIndex;
@property (nonatomic, strong, readwrite) UIView *indicator;
@property (nonatomic, strong) UIView *indicatorBgView;

@property (nonatomic, strong) UICollectionViewFlowLayout *segmentBarLayout;


- (void)reset;

@end

@implementation JYSlideSegmentController
@synthesize viewControllers = _viewControllers;

- (instancetype)initWithViewControllers:(NSArray *)viewControllers
{
    self = [super init];
    if (self) {
        _viewControllers = [viewControllers copy];
        _selectedIndex = NSNotFound;
        _segmentHeight = 0.0f;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    self.title = @"百会IM";
    
    [self setupSubviews];
    [self reset];
    CGSize conentSize = CGSizeMake(self.view.frame.size.width * self.viewControllers.count, 0);
    [self.slideView setContentSize:conentSize];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    
}

#pragma mark - Setup
- (void)setupSubviews
{
    // iOS7 set layout
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self.view addSubview:self.segmentBar];
    [self.view addSubview:self.slideView];
    [self.segmentBar registerClass:[JYSegmentBarItem class] forCellWithReuseIdentifier:segmentBarItemID];
    [self.segmentBar addSubview:self.indicatorBgView];
}

-(void)setSegmentHeight:(CGFloat)segmentHeight
{
    _segmentHeight = segmentHeight;
}

#pragma mark - Property
- (UIScrollView *)slideView
{
    if (!_slideView) {
        CGRect frame = self.view.bounds;
        frame.size.height -= _segmentBar.frame.size.height;
        frame.size.height -= _segmentHeight;
        frame.origin.y = CGRectGetMaxY(_segmentBar.frame);
        _slideView = [[UIScrollView alloc] initWithFrame:frame];
        [_slideView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth
                                         | UIViewAutoresizingFlexibleHeight)];
        [_slideView setShowsHorizontalScrollIndicator:NO];
        [_slideView setShowsVerticalScrollIndicator:NO];
        [_slideView setPagingEnabled:YES];
        [_slideView setBounces:NO];
        [_slideView setDelegate:self];
    }
    return _slideView;
}

- (UICollectionView *)segmentBar
{
    if (!_segmentBar) {
        CGRect frame = self.view.bounds;
        frame.size.height = SEGMENT_BAR_HEIGHT;
        frame.origin.y = _segmentHeight;
        _segmentBar = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.segmentBarLayout];
        _segmentBar.backgroundColor = [UIColor whiteColor];
        _segmentBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _segmentBar.delegate = self;
        _segmentBar.dataSource = self;
        UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 1, frame.size.width, 0.5)];
        [separator setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
        [separator setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        [_segmentBar addSubview:separator];
    }
    return _segmentBar;
}

- (UIView *)indicatorBgView
{
    if (!_indicatorBgView) {
        CGRect frame = CGRectMake(0, self.segmentBar.frame.size.height - INDICATOR_HEIGHT - 1,
                                  self.view.frame.size.width / self.viewControllers.count, INDICATOR_HEIGHT);
        _indicatorBgView = [[UIView alloc] initWithFrame:frame];
        _indicatorBgView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        _indicatorBgView.backgroundColor = [UIColor clearColor];
        [_indicatorBgView addSubview:self.indicator];
    }
    return _indicatorBgView;
}

- (UIView *)indicator
{
    if (!_indicator) {
        CGFloat width = self.view.frame.size.width / self.viewControllers.count - self.indicatorInsets.left - self.indicatorInsets.right;
        CGRect frame = CGRectMake(self.indicatorInsets.left, 0, width, INDICATOR_HEIGHT);
        _indicator = [[UIView alloc] initWithFrame:frame];
        _indicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _indicator.backgroundColor = [UIColor yellowColor];
    }
    return _indicator;
}

- (void)setIndicatorInsets:(UIEdgeInsets)indicatorInsets
{
    _indicatorInsets = indicatorInsets;
    CGRect frame = _indicator.frame;
    frame.origin.x = _indicatorInsets.left;
    CGFloat width = self.view.frame.size.width / self.viewControllers.count - _indicatorInsets.left - _indicatorInsets.right;
    frame.size.width = width;
    frame.size.height = INDICATOR_HEIGHT;
    _indicator.frame = frame;
}

- (UICollectionViewFlowLayout *)segmentBarLayout
{
    if (!_segmentBarLayout) {
        _segmentBarLayout = [[UICollectionViewFlowLayout alloc] init];
        _segmentBarLayout.itemSize = CGSizeMake(self.view.frame.size.width / self.viewControllers.count, SEGMENT_BAR_HEIGHT);
        _segmentBarLayout.sectionInset = UIEdgeInsetsZero;
        _segmentBarLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _segmentBarLayout.minimumLineSpacing = 0;
        _segmentBarLayout.minimumInteritemSpacing = 0;
    }
    return _segmentBarLayout;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (_selectedIndex == selectedIndex) {
        return;
    }
    NSParameterAssert(selectedIndex >= 0 && selectedIndex < self.viewControllers.count);
    
    UIViewController *toSelectController = [self.viewControllers objectAtIndex:selectedIndex];
    
    // Add selected view controller as child view controller
    if (!toSelectController.parentViewController) {
        [self addChildViewController:toSelectController];
        CGRect rect = self.slideView.bounds;
        rect.origin.x = rect.size.width * selectedIndex;
        toSelectController.view.frame = rect;
        [self.slideView addSubview:toSelectController.view];
        [toSelectController didMoveToParentViewController:self];
    }
    _selectedIndex = selectedIndex;
    
    [self changeSegementTitleColor:10000+_selectedIndex];
}

//修改segment字体颜色
-(void)changeSegementTitleColor:(NSInteger)tag
{
    JYSegmentBarItem *segmentView = [self.segmentBar viewWithTag:tag];
    JYSegmentBarItem *otherSegementView;
    NSInteger barItemCount = [_viewControllers count];
    for (int i = 0; i<barItemCount; i++) {
        NSInteger otherTag = 10000+i;
        if(tag != otherTag)
        {
            otherSegementView = [self.view viewWithTag:otherTag];
            if(self.segmentUnSelectColor)
            {
                otherSegementView.titleLabel.textColor = self.segmentUnSelectColor;
            }
            else
            {
                otherSegementView.titleLabel.textColor = [UIColor grayColor];
            }
        }
    }
    if(self.segmentSelectColor)
    {
         segmentView.titleLabel.textColor = self.segmentSelectColor;
    }
    else
    {
        segmentView.titleLabel.textColor = naviBarAndButtonColor;
    }
    
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    // Need remove previous viewControllers
    for (UIViewController *vc in _viewControllers) {
        [vc removeFromParentViewController];
    }
    _viewControllers = [viewControllers copy];
    [self reset];
}

- (NSArray *)viewControllers
{
    return [_viewControllers copy];
}

- (UIViewController *)selectedViewController
{
    return self.viewControllers[self.selectedIndex];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if ([_dataSource respondsToSelector:@selector(numberOfSectionsInslideSegment:)]) {
        return [_dataSource numberOfSectionsInslideSegment:collectionView];
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([_dataSource respondsToSelector:@selector(slideSegment:numberOfItemsInSection:)]) {
        return [_dataSource slideSegment:collectionView numberOfItemsInSection:section];
    }
    return self.viewControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_dataSource respondsToSelector:@selector(slideSegment:cellForItemAtIndexPath:)]) {
        return [_dataSource slideSegment:collectionView cellForItemAtIndexPath:indexPath];
    }
    
    JYSegmentBarItem *segmentBarItem = [collectionView dequeueReusableCellWithReuseIdentifier:segmentBarItemID
                                                                                 forIndexPath:indexPath];
    UIViewController *vc = self.viewControllers[indexPath.row];
    segmentBarItem.tag = 10000+indexPath.row;
    if(indexPath.row == self.selectedIndex)
    {
        segmentBarItem.titleLabel.textColor = naviBarAndButtonColor;
        if(self.segmentSelectColor)
        {
            segmentBarItem.titleLabel.textColor = self.segmentSelectColor;
        }
    }
    else
    {
        segmentBarItem.titleLabel.textColor = [UIColor grayColor];
        if(self.segmentUnSelectColor)
        {
            segmentBarItem.titleLabel.textColor = self.segmentUnSelectColor;
        }
    }
    segmentBarItem.titleLabel.text = vc.title;
   
    return segmentBarItem;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 0 || indexPath.row >= self.viewControllers.count) {
        return;
    }
    
    UIViewController *vc = self.viewControllers[indexPath.row];
    if ([_delegate respondsToSelector:@selector(slideSegment:didSelectedViewController:)]) {
        [_delegate slideSegment:collectionView didSelectedViewController:vc];
    }
    [self setSelectedIndex:indexPath.row];
    [self scrollToViewWithIndex:self.selectedIndex animated:NO];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 0 || indexPath.row >= self.viewControllers.count) {
        return NO;
    }
    
    BOOL flag = YES;
    UIViewController *vc = self.viewControllers[indexPath.row];
    if ([_delegate respondsToSelector:@selector(slideSegment:shouldSelectViewController:)]) {
        flag = [_delegate slideSegment:collectionView shouldSelectViewController:vc];
    }
    return flag;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.slideView) {
        // set indicator frame
        CGRect frame = self.indicatorBgView.frame;
        CGFloat percent = scrollView.contentOffset.x / scrollView.contentSize.width;
        frame.origin.x = scrollView.frame.size.width * percent;
        self.indicatorBgView.frame = frame;
        
        NSInteger index = ceilf(percent * self.viewControllers.count);
        
        if (index >= 0 && index < self.viewControllers.count) {
            [self setSelectedIndex:index];
        }
    }
}


#pragma mark - Action
- (void)scrollToViewWithIndex:(NSInteger)index animated:(BOOL)animated
{
    CGRect rect = self.slideView.bounds;
    rect.origin.x = rect.size.width * index;
    [self.slideView setContentOffset:CGPointMake(rect.origin.x, rect.origin.y) animated:animated];
}

- (void)reset
{
    _selectedIndex = NSNotFound;
    [self setSelectedIndex:0];
    [self scrollToViewWithIndex:0 animated:NO];
   [self.segmentBar reloadData];
}

-(void)selectSegmentWithIndex:(NSInteger)index
{
    [self setSelectedIndex:index];
    [self scrollToViewWithIndex:self.selectedIndex animated:NO];
}

@end
