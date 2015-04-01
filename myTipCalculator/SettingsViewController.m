//
//  SettingsViewController.m
//  myTipCalculator
//
//  Created by pavan  on 4/1/15.
//  Copyright (c) 2015 skipit. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
- (void) updatePicker;
@end

@implementation SettingsViewController


- (void) updatePicker {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ( [defaults objectForKey:@"tipMultiplier"] == nil ) {
        [defaults setInteger:10 forKey:@"tipMultiplier"];
        [defaults synchronize];
    }
    
    NSInteger defaultTipMultiplier = [defaults integerForKey:@"tipMultiplier"];
    
    switch (defaultTipMultiplier) {
        default:
        case 10:
            [self.percentagePicker selectRow:0 inComponent:0 animated:YES];
            break;
        case 15:
            [self.percentagePicker selectRow:1 inComponent:0 animated:YES];
            break;
        case 20:
            [self.percentagePicker selectRow:2 inComponent:0 animated:YES];
            break;
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if ( self) {
        self.title = @"Calculator Settings";
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.percentageArray = @[@10, @15, @20];
    self.percentagePicker.dataSource = self;
    self.percentagePicker.delegate = self;
    
    [self updatePicker];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self updatePicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.percentageArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%d%%", (integer_t) [self.percentageArray[row] integerValue]];    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:[self.percentageArray[row] integerValue] forKey:@"tipMultiplier"];
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
