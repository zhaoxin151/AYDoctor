//
//  AYTotalNumShowCell.h
//  AYDoctor
//
//  Created by naton on 2017/10/22.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AYTotalNumShowCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *haveReceptionLab; //已接诊
@property (weak, nonatomic) IBOutlet UILabel *haveExceptionLab;  //已排除
@property (weak, nonatomic) IBOutlet UILabel *haveCleareReceptionLab; //已确诊

@end
