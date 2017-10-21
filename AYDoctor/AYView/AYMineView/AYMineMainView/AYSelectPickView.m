//
//  AYSelectPickView.m
//  AYDoctor
//
//  Created by naton on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYSelectPickView.h"

@interface AYSelectPickView()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIView* mask;
@property (nonatomic, strong) UIView* headerContainerV;
@property (nonatomic, strong) UIPickerView *pickView;
@property (nonatomic, assign) NSInteger yearIndex;

@end

@implementation AYSelectPickView

+ (instancetype)showOnView:(UIView *)view {
    AYSelectPickView *datePickView = [[AYSelectPickView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    datePickView.mask = [[UIView alloc] initWithFrame:view.bounds];
    datePickView.mask.backgroundColor = [UIColor blackColor];
    datePickView.mask.alpha = 0.3 ;
    [view addSubview:datePickView.mask];
    [view addSubview:datePickView];
    return datePickView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self addTap];
}

- (void)addTap
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(hide)];
    [self.mask addGestureRecognizer:tap];
}

- (void)hide
{
    [self removeViewFromSubView];
}


- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    _headerContainerV = [UIView new];
    _headerContainerV.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:_headerContainerV];
    
    [_headerContainerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@45);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:16.0f];
    titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    titleLabel.text = @"选择工作年限";
    [_headerContainerV addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_headerContainerV.mas_centerY);
        make.left.equalTo(_headerContainerV.mas_left).with.offset(20);
    }];
    
    UIButton *clearButton = [[UIButton alloc] init];
    clearButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [clearButton setTitleColor:[UIColor colorWithRed:0/255.0 green:160/255.0 blue:233/255.0 alpha:1] forState:UIControlStateNormal];
    [clearButton setTitle:@"确定" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clearBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_headerContainerV addSubview:clearButton];
    
    [clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_headerContainerV.mas_centerY);
        make.right.equalTo(_headerContainerV.mas_right).with.offset(-20);
    }];
    
    
    
    self.pickView = [[UIPickerView alloc] init];
    self.pickView.dataSource = self;
    self.pickView.delegate = self;
    self.pickView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.pickView];
    
    [self.pickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(_headerContainerV.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0) {
        return [AYYEARARRAY count];
    }
    return 0;
}

#pragma mark - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0) {
        self.yearIndex = row;
    }
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component == 0){
        return [AYYEARARRAY objectAtIndex:row];
    }
    return @"";
}


- (void)clearBtnClick:(UIButton *)sender {
    [self removeViewFromSubView];
}

- (void)removeViewFromSubView {
    [UIView animateWithDuration:0.25 animations:^{
        [self.mask removeFromSuperview];
        [self removeFromSuperview];
    } completion:^(BOOL finished) {
        if(self.datePickComplet) {
            self.datePickComplet(self.yearIndex);
        }
    }];
}


@end
