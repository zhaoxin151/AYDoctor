//
//  AYPatientCell.h
//  AYDoctor
//
//  Created by naton on 2017/10/22.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AYPatientCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *patientAvataImageView;
@property (weak, nonatomic) IBOutlet UILabel *patientNameLab;
@property (weak, nonatomic) IBOutlet UILabel *patientTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *patientStatusLab;

@end
