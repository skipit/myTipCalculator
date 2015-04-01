//
//  TipViewController.m
//  myTipCalculator
//
//  Created by pavan  on 4/1/15.
//  Copyright (c) 2015 skipit. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageSegment;

- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (void) onSettingsButton;
- (void) updateTipPercentageSegment;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if ( self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void) updateTipPercentageSegment {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ( [defaults objectForKey:@"tipMultiplier"] == nil ) {
        [defaults setInteger:10 forKey:@"tipMultiplier"];
        [defaults synchronize];
    }
    
    NSInteger defaultTipMultiplier = [defaults integerForKey:@"tipMultiplier"];
    
    switch (defaultTipMultiplier) {
        default:
        case 10:
            [self.tipPercentageSegment setSelectedSegmentIndex:0];
            break;
        case 15:
            [self.tipPercentageSegment setSelectedSegmentIndex:1];
            break;
        case 20:
            [self.tipPercentageSegment setSelectedSegmentIndex:2];
            break;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    [self updateTipPercentageSegment];

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

- (void) updateValues {
    float billAmount = [self.billAmountTextField.text floatValue];
    NSArray *tipMultiplier = @[@(0.10), @(0.15), @(0.20)];
    float tipAmount = billAmount * [tipMultiplier[self.tipPercentageSegment.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalAmountLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
    [self.view endEditing:YES];
}

- (IBAction)onTap:(id)sender {
   
    [self updateValues];
}

-(void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateTipPercentageSegment];
}

@end
