//
//  ViewController.h
//  2017 RUSH Scouting
//
//  Created by RUSH on 1/21/17.
//  Copyright © 2017 Team RUSH 27. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController



// General: This covers the more general bits of the scotuing app and what we want to record

    // Match Number
        @property (weak, nonatomic) IBOutlet UILabel *generalMatchNumberLbl;
        @property (weak, nonatomic) IBOutlet UIStepper *generalMatchNumberStp;

    - (IBAction)didChangeMatchNum:(UIStepper *)sender;

    // Team Number
        @property (weak, nonatomic) IBOutlet UITextField *generalTeamNumberTxt;

        @property (weak, nonatomic) IBOutlet UILabel *generalTeamNumLbl;

    - (IBAction)didChangeTeamNum:(UITextField *)sender;

    // Scouter Number
        @property (weak, nonatomic) IBOutlet UITextField *generalScouterNumberTxt;

        @property (weak, nonatomic) IBOutlet UILabel *generalScouterNumLbl;

        - (IBAction)didChangeScouterNumber:(UITextField *)sender;

    // Confirm Submit
        @property (weak, nonatomic) IBOutlet UISegmentedControl *generalSubmitConfirmSgm;

    - (IBAction)didChangeSubmitConfirm:(UISegmentedControl *)sender;

    // The Submit button and function
        @property (weak, nonatomic) IBOutlet UIButton *generalSubmitBtt;

    - (IBAction)didChangeSubmit:(UIButton *)sender;
// End of General

// Auton: Any code pretaining to the Autonomous period
    // Robot Starting Location
        @property (weak, nonatomic) IBOutlet UISegmentedControl *autonStartingLocationSgm;

        @property (weak, nonatomic) IBOutlet UILabel *autonStartingLocationLbl;


    - (IBAction)didChangeStartLocation:(UISegmentedControl *)sender;

    // Robot Crossed the Base Line
        @property (weak, nonatomic) IBOutlet UISegmentedControl *autonCrossLineSgm;

    // Robot Delivered Gear
        @property (weak, nonatomic) IBOutlet UISegmentedControl *autonDeliverGearSgm;

    - (IBAction)didChangeAutonDeliverGear:(UISegmentedControl *)sender;

    // Where was the Gear Delivered
        @property (weak, nonatomic) IBOutlet UISegmentedControl *autonGearLiftSgm;

    // Low Goals Scored in Auton
        @property (weak, nonatomic) IBOutlet UILabel *autonLowGoalLbl;
        @property (weak, nonatomic) IBOutlet UIStepper *autonLowGoals;

    - (IBAction)didChangeAutonLowGoals:(UIStepper *)sender;

    // High Goals Scored in Auton
        @property (weak, nonatomic) IBOutlet UILabel *autonHighGoalLbl;
        @property (weak, nonatomic) IBOutlet UIStepper *autonHighGoalStp;

    - (IBAction)didChangeAutonHighGoal:(UIStepper *)sender;

    // Triggered a Hopper in Auton
        @property (weak, nonatomic) IBOutlet UISegmentedControl *autonHopperTriggeredSgm;

// End of Auton

// Teleop

    // Number of Cycles
        @property (weak, nonatomic) IBOutlet UILabel *teleopNumCyclesLbl;
        @property (weak, nonatomic) IBOutlet UIStepper *teleopNumCyclesStp;

    - (IBAction)didChangeNumCycles:(UIStepper *)sender;

    // Number of Balls per Cycle
        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopFuelPerCycleLowSgm;


        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopFuelPerCycleHighSgm;





    // Delivered Gears
        @property (weak, nonatomic) IBOutlet UILabel *teleopDeliverGearLbl;
        @property (weak, nonatomic) IBOutlet UIStepper *teleopDeliverGearStp;

    - (IBAction)didChangeTeleopDeliverGear:(UIStepper *)sender;


    // Primary Strategy
        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopStrategySgm;

    // Driver Skill
        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopDriverSkillSgm;

        @property (weak, nonatomic) IBOutlet UILabel *teleopDriverSkillLbl;

        - (IBAction)didChangeDriverSkill:(UISegmentedControl *)sender;

    // Defense
        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopPlayedDefenseSgm;

    - (IBAction)didChangePlayedDefense:(UISegmentedControl *)sender;

        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopDefenseSkillSgm;

    // Climbing
        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopClimbSgm;

    - (IBAction)didChangeClimb:(UISegmentedControl *)sender;

        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopClimbTimeSgm;

    // Pick up Gears from Ground
        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopGroundGearsSgm;

    //
@property (weak, nonatomic) IBOutlet UISegmentedControl *teleopGroundFuel;


    // Stuff added Later
    @property (weak, nonatomic) IBOutlet UILabel *generalFailedConfirmationLbl;

        // Shooting Location

        @property (weak, nonatomic) IBOutlet UISegmentedControl *teleopShootingLocationSgm;

        - (IBAction)didChangeShootingLocation:(UISegmentedControl *)sender;

        @property (weak, nonatomic) IBOutlet UILabel *teleopShootingLocationLbl;




-(void) Save;
-(void) NextMatch;
@end

