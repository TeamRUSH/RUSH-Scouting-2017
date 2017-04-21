//
//  SecondViewController.h
//  2017 RUSH Scouting
//
//  Created by RUSH on 2/1/17.
//  Copyright © 2017 Team RUSH 27. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIStepper *debugStepper;
- (IBAction)debugStepperAction:(UIStepper *)sender;
@property (weak, nonatomic) IBOutlet UILabel *debugLable;

@end
