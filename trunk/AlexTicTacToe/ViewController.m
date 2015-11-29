//
//  ViewController.m
//  AlexTicTacToe
//
//  Created by Aleksandar Janakievski on 11/26/15.
//  Copyright © 2015 Aleksandar Janakievski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

@synthesize player;

@synthesize quadrant1;
@synthesize quadrant2;
@synthesize quadrant3;
@synthesize quadrant4;
@synthesize quadrant5;
@synthesize quadrant6;
@synthesize quadrant7;
@synthesize quadrant8;
@synthesize quadrant9;
@synthesize drawCount;
@synthesize PlayerName1;
@synthesize PlayerName2;
@synthesize playerScore1;
@synthesize playerScore2;
@synthesize Player1TextField;
@synthesize Player2TextField;
@synthesize PlayernameLabel1;
@synthesize PlayerNamelabel2;
@synthesize PlayerInfoLabel1;
@synthesize PlayerInfoLabel2;
@synthesize ScoreLabel1;
@synthesize ScoreLabel2;
@synthesize MainViewView;
@synthesize EnterNameView;
@synthesize Pointer1, Pointer2;
@synthesize PlayerNameTextField1 ,PlayerNameTextFiled2;

- (void)viewDidLoad {
    [super viewDidLoad];
    player =1; //set player to 1
    drawCount =0;
    EnterNameView.hidden = NO;
    [self askForPlayerName];
    
    
    //for dismissing the keyboard
    // Player1TextField.returnKeyType = UIReturnKeyDone;
    [Player1TextField setDelegate:self];
  
    //rotate labels for better play experience ;)
    [PlayerInfoLabel1 setTransform:CGAffineTransformMakeRotation(-M_PI / 1)];
    [PlayernameLabel1 setTransform:CGAffineTransformMakeRotation(-M_PI / 1)];
    [ScoreLabel1 setTransform:CGAffineTransformMakeRotation(-M_PI / 1)];
    [Pointer1 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];

    //set delegate to self
    [PlayerNameTextField1 setDelegate:self];
    [PlayerNameTextFiled2 setDelegate:self];
   // [Player1TextField setDelegate:self];
  //  [Player2TextField setDelegate:self];
    
    //set initial pointer
    [self setInitialPointer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)checkforWinCases{
    //write out all the cases
    //checking for text on button; It can be changer to anyting(image tag...)
    // Wins for X
    ///bug when ...
    //oxo
    //xox
    //oox
    // cheking if we have a win is from youtube tutorial https://www.youtube.com/watch?v=mqEz6B-Mz2I
    
    
    if ((([[quadrant1 titleLabel]text] == [[quadrant2 titleLabel]text]) && ([[quadrant1 titleLabel]text] == [[quadrant3 titleLabel]text]) && ([[[quadrant1 titleLabel]text]  isEqual: @"X"])) ||
        (([[quadrant4 titleLabel]text] == [[quadrant5 titleLabel]text]) && ([[quadrant4 titleLabel]text] == [[quadrant6 titleLabel]text]) && ([[[quadrant4 titleLabel]text]  isEqual: @"X"])) ||
        (([[quadrant7 titleLabel]text] == [[quadrant8 titleLabel]text]) && ([[quadrant7 titleLabel]text] == [[quadrant9 titleLabel]text]) && ([[[quadrant7 titleLabel]text]  isEqual: @"X"])) ||
        (([[quadrant1 titleLabel]text] == [[quadrant5 titleLabel]text]) && ([[quadrant1 titleLabel]text] == [[quadrant9 titleLabel]text]) && ([[[quadrant1 titleLabel]text]  isEqual: @"X"])) ||
        (([[quadrant3 titleLabel]text] == [[quadrant5 titleLabel]text]) && ([[quadrant3 titleLabel]text] == [[quadrant7 titleLabel]text]) && ([[[quadrant3 titleLabel]text]  isEqual: @"X"])) ||
        (([[quadrant1 titleLabel]text] == [[quadrant4 titleLabel]text]) && ([[quadrant1 titleLabel]text] == [[quadrant7 titleLabel]text]) && ([[[quadrant1 titleLabel]text]  isEqual: @"X"])) ||
        (([[quadrant2 titleLabel]text] == [[quadrant5 titleLabel]text]) && ([[quadrant2 titleLabel]text] == [[quadrant8 titleLabel]text]) && ([[[quadrant2 titleLabel]text]  isEqual: @"X"])) ||
        (([[quadrant3 titleLabel]text] == [[quadrant6 titleLabel]text]) && ([[quadrant3 titleLabel]text] == [[quadrant9 titleLabel]text]) && ([[[quadrant3 titleLabel]text]  isEqual: @"X"]))) {
        quadrant1.enabled = NO; quadrant2.enabled = NO; quadrant3.enabled = NO; quadrant4.enabled = NO; quadrant5.enabled = NO; quadrant6.enabled = NO; quadrant7.enabled = NO; quadrant8.enabled = NO; quadrant9.enabled = NO;
        //resets quadrants in 1 sec
       // [self performSelector:@selector(resetQuadrants) withObject:nil afterDelay:1.0f];
        [self resetQuadrants];
        NSLog(@"X won");
//        NSString *message1 = [NSString stringWithFormat:@"Player X %@ Won!", PlayerName1];
//        UIAlertView *alert3 = [[UIAlertView alloc]initWithTitle: @"Congratulations!!! We have a Winner!"
//                                                       message: message1
//                                                      delegate: self
//                                             cancelButtonTitle:@"OK"
//                                             otherButtonTitles:nil];
//        
//        [alert3 setTag:3];
//        [alert3 show];
        playerScore1 ++;
        [ScoreLabel1 setText:[NSString stringWithFormat:@"%i",playerScore1]];
        
    }
    
    
    // Wins for O
    if ((([[quadrant1 titleLabel]text] == [[quadrant2 titleLabel]text]) && ([[quadrant1 titleLabel]text] == [[quadrant3 titleLabel]text]) && ([[[quadrant1 titleLabel]text]  isEqual: @"O"])) ||
        (([[quadrant4 titleLabel]text] == [[quadrant5 titleLabel]text]) && ([[quadrant4 titleLabel]text] == [[quadrant6 titleLabel]text]) && ([[[quadrant4 titleLabel]text]  isEqual: @"O"])) ||
        (([[quadrant7 titleLabel]text] == [[quadrant8 titleLabel]text]) && ([[quadrant7 titleLabel]text] == [[quadrant9 titleLabel]text]) && ([[[quadrant7 titleLabel]text]  isEqual: @"O"])) ||
        (([[quadrant1 titleLabel]text] == [[quadrant5 titleLabel]text]) && ([[quadrant1 titleLabel]text] == [[quadrant9 titleLabel]text]) && ([[[quadrant1 titleLabel]text]  isEqual: @"O"])) ||
        (([[quadrant3 titleLabel]text] == [[quadrant5 titleLabel]text]) && ([[quadrant3 titleLabel]text] == [[quadrant7 titleLabel]text]) && ([[[quadrant3 titleLabel]text]  isEqual: @"O"])) ||
        (([[quadrant1 titleLabel]text] == [[quadrant4 titleLabel]text]) && ([[quadrant1 titleLabel]text] == [[quadrant7 titleLabel]text]) && ([[[quadrant1 titleLabel]text]  isEqual: @"O"])) ||
        (([[quadrant2 titleLabel]text] == [[quadrant5 titleLabel]text]) && ([[quadrant2 titleLabel]text] == [[quadrant8 titleLabel]text]) && ([[[quadrant2 titleLabel]text]  isEqual: @"O"])) ||
        (([[quadrant3 titleLabel]text] == [[quadrant6 titleLabel]text]) && ([[quadrant3 titleLabel]text] == [[quadrant9 titleLabel]text]) && ([[[quadrant3 titleLabel]text]  isEqual: @"O"]))) {
        quadrant1.enabled = NO; quadrant2.enabled = NO; quadrant3.enabled = NO; quadrant4.enabled = NO; quadrant5.enabled = NO; quadrant6.enabled = NO; quadrant7.enabled = NO; quadrant8.enabled = NO; quadrant9.enabled = NO;
       // [self performSelector:@selector(resetQuadrants) withObject:nil afterDelay:1.0f];
        [self resetQuadrants];
//        NSLog(@"O won");
//        NSString *message2 = [NSString stringWithFormat:@"Player O %@ Won!", PlayerName2];
//        UIAlertView *alert4 = [[UIAlertView alloc]initWithTitle: @"Congratulations!!! We have a Winner!"
//                                                       message: message2
//                                                      delegate: self
//                                             cancelButtonTitle:@"OK"
//                                             otherButtonTitles:nil];
//        
//        [alert4 setTag:4];
//        [alert4 show];
        
        playerScore2++;
        [ScoreLabel2 setText:[NSString stringWithFormat:@"%i",playerScore2] ];
    }
}

- (void)resetQuadrants {
    
    //resets the Game
    //clear texts
    //
    drawCount =0;// reset the draw counter
    player=1; // always start with x
    
    [quadrant1 setTitle:@" " forState:UIControlStateNormal]; [quadrant1 setEnabled:YES];
    [quadrant2 setTitle:@" " forState:UIControlStateNormal]; [quadrant2 setEnabled:YES];
    [quadrant3 setTitle:@" " forState:UIControlStateNormal]; [quadrant3 setEnabled:YES];
    
    [quadrant4 setTitle:@" " forState:UIControlStateNormal]; [quadrant4 setEnabled:YES];
    [quadrant5 setTitle:@" " forState:UIControlStateNormal]; [quadrant5 setEnabled:YES];
    [quadrant6 setTitle:@" " forState:UIControlStateNormal]; [quadrant6 setEnabled:YES];
    
    [quadrant7 setTitle:@" " forState:UIControlStateNormal]; [quadrant7 setEnabled:YES];
    [quadrant8 setTitle:@" " forState:UIControlStateNormal]; [quadrant8 setEnabled:YES];
    [quadrant9 setTitle:@" " forState:UIControlStateNormal]; [quadrant9 setEnabled:YES];
    [self setInitialPointer];

}



-(IBAction)PlayerTurn:(id)sender{

   
    UIButton *pressedquadrant = (UIButton *) sender; // where user pressed
    [pressedquadrant setEnabled:NO];

    Pointer1.hidden = YES;
    Pointer2.hidden = YES;

    
    switch (player) {
        case 1:
            
            //write x for player 1 and O for player 2
            [pressedquadrant setTitle:@"X" forState:UIControlStateNormal];
            player = 2 ;
            // change player
            
            //navigate the pointer
            Pointer1.hidden = YES;
            Pointer2.hidden = NO;
            
            drawCount ++;
            break;
        case 2:
            [pressedquadrant setTitle:@"O" forState:UIControlStateNormal];
            player = 1;
            Pointer1.hidden =NO;
            Pointer2.hidden = YES;
            drawCount ++;
            break;
        default:
            exit(0);
            break;
    }
    
    
    //turn is over; check for winner
[self performSelector:@selector(checkforWinCases) withObject:nil afterDelay:1.0f];
  //  [self checkforWinCases];
    
    if(drawCount == 9){
        // all moves made, no win , thous draw
        NSLog(@"Draw");
        
//        NSString *message3 = [NSString stringWithFormat:@"We have a Draw! Nobody won! please try again %@ , %@", PlayerName1, PlayerName2];
//        UIAlertView *alert5 = [[UIAlertView alloc]initWithTitle: @"Rough Game! "
//                                                        message: message3
//                                                       delegate: self
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        
//        [alert5 setTag:5];
//        [alert5 show];
        [self resetQuadrants];
    }
}

-(void) askForPlayerName
{
    //clearing up text fields
    Player1TextField =nil;
    Player2TextField =nil;
    EnterNameView.hidden =NO;
}


- (IBAction)DonButtonTAP:(id)sender {
    //check if something is enetered
   
        if (PlayerNameTextField1.text.length ==0) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"No Name entered Player 1"
                                                           message: @"Since you are too lazy to enter name..... From Now on you will be called \"Master Strunf\""
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            
            [alert setTag:1];
            [alert show];
            
            PlayerName1 = @"Master Strunf";
        }
    else
    {
        PlayerName1 = PlayerNameTextField1.text;
    }
        
        if (PlayerNameTextFiled2.text.length == 0){
            
            UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle: @"No Name entered Player 2"
                                                           message: @"Since you are too lazy to enter name..... From Now on you will be known as \"Gargamel the Evil Wizard \""
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            
            [alert1 setTag:2];
            [alert1 show];
            
            PlayerName2 = @"Gargamel the Evil Wizard ";
        
        }
    else
    {
        PlayerName2 = PlayerNameTextFiled2.text;
    }

    NSLog(@"Player 1 names is: %@", PlayerName1);
    NSLog(@"Player 2 names is: %@", PlayerName2);
    
    //Set the names
    [PlayernameLabel1 setText:PlayerName1];
  //  [PlayernameLabel1 setText:[NSString stringWithFormat:@"%@ Plays with X", PlayerName1]];
    [PlayerNamelabel2 setText:PlayerName2];
  //  [PlayerNamelabel2 setText:[NSString stringWithFormat:@"%@ Plays with O", PlayerName2]];
    [self setInitialPointer];
    
    //reset the score
//    ScoreLabel1 =0;
//    ScoreLabel2 =0;

    
    EnterNameView.hidden = YES;
    
}

-(void) setInitialPointer
{
    Pointer1.hidden =NO;
    Pointer2.hidden =YES;
}

// get rid of the keyboard on return clicked !!! can't make this work !!!!!! - yes it works now after setting delegate //to self.
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   // [textField resignFirstResponder];
    [self.view endEditing:YES];
    return YES;
}


- (IBAction)OverlayTAP:(id)sender {
    // [Player1TextField resignFirstResponder];
    [self.view endEditing:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  //  activeField = nil;
}

- (IBAction)ThemeSelected1:(id)sender {
    //set the background
    MainViewView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background12.jpg"]];
    [self DonButtonTAP:(self)];
}

- (IBAction)ThemeSelected2:(id)sender {
    //set the background
    MainViewView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background6.jpg"]];
    [self DonButtonTAP:(self)];
}

- (IBAction)ThemeSelected3:(id)sender {
    //set the background
    MainViewView.backgroundColor = [UIColor whiteColor];
    [self DonButtonTAP:(self)];
}

- (IBAction)ThemeSelected4:(id)sender {
    //set the background
    MainViewView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background7.jpg"]];
    [self DonButtonTAP:(self)];
}

- (IBAction)ThemeSelected5:(id)sender {
    //set the background
    MainViewView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background11.jpg"]];
    [self DonButtonTAP:(self)];
}
- (IBAction)LogoTAP:(id)sender {
    
    [self askForPlayerName];
    
    //resset to placeholder
    PlayerNameTextField1.text =nil;
    PlayerNameTextFiled2.text =nil;
    [self resetQuadrants];
    playerScore1 =0;
    [ScoreLabel1 setText:[NSString stringWithFormat:@"%i",playerScore1]];
    playerScore2 = 0;
    [ScoreLabel2 setText:[NSString stringWithFormat:@"%i",playerScore2]];
}
@end
