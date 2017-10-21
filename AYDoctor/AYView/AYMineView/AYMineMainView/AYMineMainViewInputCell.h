//
//  AYMineMainViewInputCell.h
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AYMineMainViewInputCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
//设置tag,用来区分三个textView 1.就诊地点 2.擅长 3.简介
@property (assign, nonatomic) NSInteger textViewTag;

@property (nonatomic , copy) void (^textViewEndEditing)(NSString *text, NSInteger textViewTag);

@end
