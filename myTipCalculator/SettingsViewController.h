//
//  SettingsViewController.h
//  myTipCalculator
//
//  Created by pavan  on 4/1/15.
//  Copyright (c) 2015 skipit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *percentagePicker;
@property (strong, nonatomic)          NSArray *percentageArray;
@end
