//
//  SecondViewController.m
//  2017 RUSH Scouting
//
//  Created by RUSH on 2/1/17.
//  Copyright © 2017 Team RUSH 27. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)debugStepperAction:(UIStepper *)sender {
    int val = sender.value;
    _debugLable.text = [NSString stringWithFormat:@"%d",val];

    
    
    
}
@end
