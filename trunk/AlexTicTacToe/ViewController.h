//
//  ViewController.h
//  AlexTicTacToe
//
//  Created by Aleksandar Janakievski on 11/26/15.
//  Copyright © 2015 Aleksandar Janakievski. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ScoreBoard+CoreDataProperties.h"
#include "ScoreBoard.h"
@interface ViewController : UIViewController  <UITextFieldDelegate>
@property  int player; // needed for writh logic; 
@property (weak, nonatomic) IBOutlet UILabel *PlayerInfoLabel1;
@property (weak, nonatomic) IBOutlet UILabel *PlayerInfoLabel2;

@property (weak, nonatomic) IBOutlet UIView *EnterNameView;

@property(nonatomic,retain) IBOutlet UIButton *quadrant1;
@property(nonatomic,retain) IBOutlet UIButton *quadrant2;
@property(nonatomic,retain) IBOutlet UIButton *quadrant3;


@property(nonatomic,retain) IBOutlet UIButton *quadrant4;
@property(nonatomic,retain) IBOutlet UIButton *quadrant5;
@property(nonatomic,retain) IBOutlet UIButton *quadrant6;
@property (strong, nonatomic) IBOutlet UIView *MainViewView;
@property (weak, nonatomic) IBOutlet UIImageView *Pointer1;
@property (weak, nonatomic) IBOutlet UIImageView *Pointer2;
@property (weak, nonatomic) IBOutlet UIButton *OverlayOusideTAP;
- (IBAction)OverlayTAP:(id)sender;

@property(nonatomic,retain) IBOutlet UIButton *quadrant7;
@property(nonatomic,retain) IBOutlet UIButton *quadrant8;
@property(nonatomic,retain) IBOutlet UIButton *quadrant9;

@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel1;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel2;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *loader;

@property (weak, nonatomic) IBOutlet UITextField *Player1TextField;
@property (weak, nonatomic) IBOutlet UITextField *Player2TextField;
- (IBAction)LogoTAP:(id)sender;

@property (nonatomic, assign) int drawCount;
@property (weak, nonatomic) IBOutlet UILabel *PlayernameLabel1;
- (IBAction)DonButtonTAP:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *PlayerNamelabel2;
@property (weak, nonatomic) IBOutlet UITextField *PlayerNameTextField1;
@property (weak, nonatomic) IBOutlet UITextField *PlayerNameTextFiled2;

- (IBAction)ThemeSelected1:(id)sender;
- (IBAction)ThemeSelected2:(id)sender;
- (IBAction)ThemeSelected3:(id)sender;
- (IBAction)ThemeSelected4:(id)sender;
- (IBAction)ThemeSelected5:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ThemeSelected4;



// not time to write out the core data and manage the objects
//simple string variables used for plays name and score tracking

@property (nonatomic, copy) NSString* PlayerName1;
@property (nonatomic, copy) NSString* PlayerName2;
@property (nonatomic,assign) int playerScore1;
@property (nonatomic,assign) int playerScore2;


@end

