//
//  ViewController.m
//  2017 RUSH Scouting
//
//  Created by RUSH on 1/21/17.
//  Copyright © 2017 Team RUSH 27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Match Number was modified

        - (IBAction)didChangeMatchNum:(UIStepper *)sender {
            int val = sender.value;
            _generalMatchNumberLbl.text = [NSString stringWithFormat:@"Match #: %d",val];
        
        }

// Team Number was modified
        - (IBAction)didChangeTeamNum:(UITextField *)sender {
            
            if ([[sender text] length] > 4) {
                [sender setText:[[sender text] substringToIndex:4]];
            }
            if([[sender text] length] == 0) {
                
                _generalTeamNumLbl.textColor = [UIColor redColor];
            }
            else
            {
                _generalTeamNumLbl.textColor = [UIColor blackColor];
            }
        }

// Confirming Submition
        - (IBAction)didChangeSubmitConfirm:(UISegmentedControl *)sender {
            
            if([_generalTeamNumberTxt.text length]!= 0 & [_generalScouterNumberTxt.text length]!= 0 & _autonStartingLocationSgm.selectedSegmentIndex!= -1 &_teleopDriverSkillSgm.selectedSegmentIndex!= -1 & _teleopShootingLocationSgm.selectedSegmentIndex != -1)  {
                
                [_generalSubmitBtt setEnabled:YES];
                [_generalFailedConfirmationLbl setHidden:YES];
                
            
            _teleopDriverSkillLbl.textColor = [UIColor blackColor];
            _teleopShootingLocationLbl.textColor = [UIColor blackColor];
            _generalTeamNumLbl.textColor = [UIColor blackColor];
            _generalScouterNumLbl.textColor = [UIColor blackColor];
            _autonStartingLocationLbl.textColor = [UIColor blackColor];
            }
            else {
                
                [_generalSubmitBtt setEnabled:NO];
                [_generalSubmitConfirmSgm setSelectedSegmentIndex:0];
                [_generalFailedConfirmationLbl setHidden:NO];
                [self didChangeStartLocation:_autonStartingLocationSgm];
                [self didChangeShootingLocation:_teleopShootingLocationSgm];
                [self didChangeTeamNum:_generalTeamNumberTxt];
                [self didChangeDriverSkill:_teleopDriverSkillSgm];
                [self didChangeScouterNumber:_generalScouterNumberTxt];
                [_generalSubmitBtt setEnabled:NO];
                
            }
        }
// Pressed the Submit button
        - (IBAction)didChangeSubmit:(UIButton *)sender {
            
            [self Save];
            [self NextMatch];

        }

// Did change the start location
        - (IBAction)didChangeStartLocation:(UISegmentedControl *)sender {

            if(_autonStartingLocationSgm.selectedSegmentIndex == -1) {
                _autonStartingLocationLbl.textColor = [UIColor redColor];
                }
            else
            {
                _autonStartingLocationLbl.textColor = [UIColor blackColor];
            }
        
        
        
        }



// Auton Gear was Deliviered
        - (IBAction)didChangeAutonDeliverGear:(UISegmentedControl *)sender {

            if (_autonDeliverGearSgm.selectedSegmentIndex == 1){
                [_autonGearLiftSgm setEnabled:YES];
                
            }
            
            else {
                [_autonGearLiftSgm setEnabled:NO];
                _autonGearLiftSgm.selectedSegmentIndex = -1;
            }
        
        
        }



// The number of balls scored in low goal was changed
        - (IBAction)didChangeAutonLowGoals:(UIStepper *)sender {

            int val = sender.value;
            _autonLowGoalLbl.text = [NSString stringWithFormat:@"#: %d",val];
        

        }



// The number of balls scored in the high goal was changed
        - (IBAction)didChangeAutonHighGoal:(UIStepper *)sender {

            int val = sender.value;
            _autonHighGoalLbl.text = [NSString stringWithFormat:@"#: %d",val];
        
        }

// Changed the number of Cycles the robot did during teleop


        - (IBAction)didChangeNumCycles:(UIStepper *)sender {
        
            int val = sender.value;
            _teleopNumCyclesLbl.text = [NSString stringWithFormat:@"#: %d",val];
            
            if (val > 0){
                [_teleopFuelPerCycleLowSgm setEnabled:YES];
                  [_teleopFuelPerCycleHighSgm setEnabled:YES];
            }
            else {
                [_teleopFuelPerCycleLowSgm setEnabled:NO];
                _teleopFuelPerCycleLowSgm.selectedSegmentIndex = 0;

                [_teleopFuelPerCycleHighSgm setEnabled:NO];
                _teleopFuelPerCycleHighSgm.selectedSegmentIndex = 0;
}
        
        
        
        
        }
// Changed the number of gears a robot delivered during teleop

        - (IBAction)didChangeTeleopDeliverGear:(UIStepper *)sender {
            
            int val = sender.value;
            _teleopDeliverGearLbl.text = [NSString stringWithFormat:@"#: %d",val];
        
        
        }


// The robot played defense was chagned

        - (IBAction)didChangePlayedDefense:(UISegmentedControl *)sender {
            
            if (_teleopPlayedDefenseSgm.selectedSegmentIndex == 1) {
                [_teleopDefenseSkillSgm setEnabled:YES];
            }
            else {
                [_teleopDefenseSkillSgm setEnabled:NO];
                _teleopDefenseSkillSgm.selectedSegmentIndex = -1;
            }
        }

// Did change the segemented control for if the robot climbed
        - (IBAction)didChangeClimb:(UISegmentedControl *)sender {

            if (_teleopClimbSgm.selectedSegmentIndex == 1) {
                [_teleopClimbTimeSgm setEnabled:YES];
            }
            else {
                [_teleopClimbTimeSgm setEnabled:NO];
                _teleopClimbTimeSgm.selectedSegmentIndex = -1;
            }
        }

        
        






// Functions for Later
-(void) Save {
        // Creating a Local varible to be used with the Save fuction for Strategy to change the title "Fule and Gears" to "Both" when saving.
            NSString *Strategy = [_teleopStrategySgm titleForSegmentAtIndex:fmax(_teleopStrategySgm.selectedSegmentIndex,0)];
    
            if ([Strategy  isEqual:@"Fuel & Gears"])
            {
                Strategy = @"Both";
            }
    
    NSString *AutoGearLift = @"";
        if (_autonGearLiftSgm.selectedSegmentIndex == -1)
        {
        AutoGearLift = @"None";
        }
        else {
            AutoGearLift = [_autonGearLiftSgm titleForSegmentAtIndex:fmax(_autonGearLiftSgm.selectedSegmentIndex,0)];
            }
    NSString *TimeToClimb = @"";
        if (_teleopClimbTimeSgm.selectedSegmentIndex == -1)
        {
            TimeToClimb = @"0";
        }
    
        else {
        TimeToClimb = [_teleopClimbTimeSgm titleForSegmentAtIndex:fmax(_teleopClimbTimeSgm.selectedSegmentIndex,0)];
        }

    int number = [_generalMatchNumberStp value];
    NSString *resultLine = [NSString stringWithFormat:@"%i,%i,%@,%i,%i,%@,%i,%i,%i,%i,%i,%@,%@,%i,%@,%i,%i,%i,%i,%@,%i,%@",
    /*	Match Number */             [[NSNumber numberWithDouble:_generalMatchNumberStp.value] intValue],
    /*	Team Number */              [_generalTeamNumberTxt.text intValue],
    /*	Starting Location */        [_autonStartingLocationSgm titleForSegmentAtIndex:fmax(_autonStartingLocationSgm.selectedSegmentIndex,0)],
    /*	Auto Crossed Base Line */	_autonCrossLineSgm.selectedSegmentIndex,
    /*	Auto Delivered Gear */      _autonDeliverGearSgm.selectedSegmentIndex,
    /*	Auto Gear Location */       AutoGearLift,
    /*	Auto Low Goals */           (int)_autonLowGoals.value,
    /*	Auto High Goals */          (int)_autonHighGoalStp.value,
    /*	Auto Triggered Hopper */	_autonHopperTriggeredSgm.selectedSegmentIndex,
    /*	Tele Gears Scored */        (int)_teleopDeliverGearStp.value,
    /*	Tele Fuel Cycles */         (int)_teleopNumCyclesStp.value,
    /*	Tele Fuel per Cycle High */	[_teleopFuelPerCycleHighSgm titleForSegmentAtIndex:fmax(_teleopFuelPerCycleHighSgm.selectedSegmentIndex,0)],
    /*	Tele Fuel per Cycle Low */	[_teleopFuelPerCycleLowSgm titleForSegmentAtIndex:fmax(_teleopFuelPerCycleLowSgm.selectedSegmentIndex,0)],
    /*	Fuel from Ground */         _teleopGroundFuel.selectedSegmentIndex,
    /*	Primary Strategy */         Strategy,
    /*	Driver Skill */             _teleopDriverSkillSgm.selectedSegmentIndex +1,
    /*	Played Defense */           _teleopPlayedDefenseSgm.selectedSegmentIndex,
    /*	Defensive Skill */          _teleopDefenseSkillSgm.selectedSegmentIndex +1,
    /*	Climbed */                  _teleopClimbSgm.selectedSegmentIndex,
    /*	Time to Climb */            TimeToClimb,
    /*	Ground Gear Pickup */       _teleopGroundGearsSgm.selectedSegmentIndex,
    /*	Shooting Location */        [_teleopShootingLocationSgm titleForSegmentAtIndex:fmax(_teleopShootingLocationSgm.selectedSegmentIndex,0)]];
                           
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
        
    // Code for saving, mainly around the CSV part
    NSString *docPath= [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *fileName=@"";
    NSString *deviceName = [[UIDevice currentDevice] name];
    
    // These if and else if statements sets the name of the CSV file to what we want which is, match nuber_Name of IPad_Person Scouting
    // This also insures that the order in which each of the files is organized is the way we want, that way all the files for 1 match are together
    if(number<10){
        fileName =[NSString stringWithFormat:@"00%i_%@_%@.csv",
                   [[NSNumber numberWithDouble:_generalMatchNumberStp.value] intValue], deviceName, _generalScouterNumberTxt.text];
    }
    else if(number/10<10){
        fileName =[NSString stringWithFormat:@"0%i_%@_%@.csv",
        [[NSNumber numberWithDouble:_generalMatchNumberStp.value] intValue], deviceName, _generalScouterNumberTxt.text];
    }
    else {
        fileName =[NSString stringWithFormat:@"%i_%@_%@.csv",
                   [[NSNumber numberWithDouble:_generalMatchNumberStp.value] intValue], deviceName, _generalScouterNumberTxt.text];
    }
    
    
    NSString *fullFilePath=[docPath stringByAppendingPathComponent:fileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:docPath]) {
        [[NSFileManager defaultManager]
         createFileAtPath:fileName contents:nil attributes:nil];
    }
    [resultLine writeToFile:fullFilePath atomically:YES encoding:NSUTF8StringEncoding error: nil];
    
    

    
}

-(void) NextMatch {
    // Next Match and Team Number
    [_generalMatchNumberStp setValue:_generalMatchNumberStp.value +1];
    [_generalTeamNumberTxt setText:NULL];
    
    
    
    // Auton
    [_autonStartingLocationSgm setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [_autonCrossLineSgm setSelectedSegmentIndex: 0];
    [_autonDeliverGearSgm setSelectedSegmentIndex: 0];
    [_autonGearLiftSgm setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [_autonLowGoals setValue:0];
    _autonHighGoalStp.value = 0;
    [_autonHopperTriggeredSgm setSelectedSegmentIndex:0];
    
    
    
    // Teleop
  
    _teleopNumCyclesStp.value = 0;
    [_teleopFuelPerCycleLowSgm setSelectedSegmentIndex:0];
    [_teleopFuelPerCycleHighSgm setSelectedSegmentIndex:0];
    _teleopDeliverGearStp.value = 0;
    [_teleopGroundFuel setSelectedSegmentIndex: 0];
    [_teleopStrategySgm setSelectedSegmentIndex: 0];
    [_teleopDriverSkillSgm setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [_teleopPlayedDefenseSgm setSelectedSegmentIndex: 0];
    [_teleopDefenseSkillSgm setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [_teleopClimbSgm setSelectedSegmentIndex: 0];
    [_teleopClimbTimeSgm setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [_teleopGroundGearsSgm setSelectedSegmentIndex: 0];
    [_generalSubmitConfirmSgm setSelectedSegmentIndex: 0];
    [_teleopShootingLocationSgm setSelectedSegmentIndex:0];
    
    // Reset the Actions based on their now default values
    
    [self didChangeClimb:_teleopClimbSgm];
    [self didChangeTeamNum:_generalTeamNumberTxt];
    [self didChangeMatchNum:_generalMatchNumberStp];
    [self didChangeSubmitConfirm:_generalSubmitConfirmSgm];
    [self didChangeStartLocation:_autonStartingLocationSgm];
    [self didChangeAutonDeliverGear:_autonDeliverGearSgm];
    [self didChangeAutonLowGoals:_autonLowGoals];
    [self didChangeAutonHighGoal:_autonHighGoalStp];
    [self didChangeNumCycles:_teleopNumCyclesStp];
    [self didChangeTeleopDeliverGear:_teleopDeliverGearStp];
    [self didChangePlayedDefense:_teleopPlayedDefenseSgm];
    [self didChangeClimb:_teleopClimbSgm];
    
    // Make sure that the submit is disabled regaurdless. This is just a last ditch effort to have it disabled in case something breaks.
    
    
    [_generalSubmitBtt setEnabled:NO];
    [_generalFailedConfirmationLbl setHidden:YES];
    
    // Set colored text labels back to black text
    
    _teleopDriverSkillLbl.textColor = [UIColor blackColor];
    _teleopShootingLocationLbl.textColor = [UIColor blackColor];
    _generalTeamNumLbl.textColor = [UIColor blackColor];
    _generalScouterNumLbl.textColor = [UIColor blackColor];
    _autonStartingLocationLbl.textColor = [UIColor blackColor];
}

    // Actions Added after the save and clear function was finished

- (IBAction)didChangeShootingLocation:(UISegmentedControl *)sender {
    
    if(_teleopShootingLocationSgm.selectedSegmentIndex == -1) {
        
        _teleopShootingLocationLbl.textColor = [UIColor redColor];
    }
    else {
        _teleopShootingLocationLbl.textColor = [UIColor blackColor];
    }
}
- (IBAction)didChangeDriverSkill:(UISegmentedControl *)sender {
    if(_teleopDriverSkillSgm.selectedSegmentIndex == -1) {
        
        _teleopDriverSkillLbl.textColor = [UIColor redColor];
    }
    else
    {
        _teleopDriverSkillLbl.textColor = [UIColor blackColor];
    }
}
- (IBAction)didChangeScouterNumber:(UITextField *)sender {
    if([[sender text] length] == 0) {
        
        _generalScouterNumLbl.textColor = [UIColor redColor];
    }
    else
    {
        _generalScouterNumLbl.textColor = [UIColor blackColor];
    }
}
@end
