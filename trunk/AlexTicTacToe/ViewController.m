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


@synthesize loader;

@synthesize drawCount;


@synthesize PlayerName1;
@synthesize PlayerName2;
@synthesize playerScore1;
@synthesize playerScore2;

@synthesize Player1TextField;
@synthesize Player2TextField;
@synthesize PlayernameLabel1;
@synthesize PlayerNamelabel2;

@synthesize EnterNameView;

- (void)viewDidLoad {
    [super viewDidLoad];
    player =1; //set player to 1
    drawCount =0;
    loader.hidden = YES;// i dnot need this
    EnterNameView.hidden = NO;
    [self askForPlayerName];
    
    //set delegate to self
    [Player1TextField setDelegate:self];
    [Player2TextField setDelegate:self];
    
    
    // Do any additional setup after loading the view, typically from a nib.
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
        [self performSelector:@selector(resetQuadrants) withObject:nil afterDelay:1.0f];
        [loader startAnimating];
        loader.hidden = NO;
        NSLog(@"X won");
        NSString *message1 = [NSString stringWithFormat:@"Player X %@ Won!", PlayerName1];
        UIAlertView *alert3 = [[UIAlertView alloc]initWithTitle: @"Congratulations!!! We have a Winner!"
                                                       message: message1
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        
        [alert3 setTag:3];
        [alert3 show];
        
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
        [self performSelector:@selector(resetQuadrants) withObject:nil afterDelay:1.0f];
        [loader startAnimating];
        loader.hidden = NO;
        NSLog(@"O won");
        NSString *message2 = [NSString stringWithFormat:@"Player O %@ Won!", PlayerName2];
        UIAlertView *alert4 = [[UIAlertView alloc]initWithTitle: @"Congratulations!!! We have a Winner!"
                                                       message: message2
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        
        [alert4 setTag:4];
        [alert4 show];
    }
}

- (void)resetQuadrants {
    
    //resets the Game
    //clear texts
    //
    drawCount =0;// reset the draw counter
    player=1; // always start with x
    
    [loader stopAnimating];
    loader.hidden = YES;
    
    
    [quadrant1 setTitle:@" " forState:UIControlStateNormal]; [quadrant1 setEnabled:YES];
    [quadrant2 setTitle:@" " forState:UIControlStateNormal]; [quadrant2 setEnabled:YES];
    [quadrant3 setTitle:@" " forState:UIControlStateNormal]; [quadrant3 setEnabled:YES];
    
    [quadrant4 setTitle:@" " forState:UIControlStateNormal]; [quadrant4 setEnabled:YES];
    [quadrant5 setTitle:@" " forState:UIControlStateNormal]; [quadrant5 setEnabled:YES];
    [quadrant6 setTitle:@" " forState:UIControlStateNormal]; [quadrant6 setEnabled:YES];
    
    [quadrant7 setTitle:@" " forState:UIControlStateNormal]; [quadrant7 setEnabled:YES];
    [quadrant8 setTitle:@" " forState:UIControlStateNormal]; [quadrant8 setEnabled:YES];
    [quadrant9 setTitle:@" " forState:UIControlStateNormal]; [quadrant9 setEnabled:YES];
    
    [self askForPlayerName];
}



-(IBAction)PlayerTurn:(id)sender{

   
    UIButton *pressedquadrant = (UIButton *) sender; // where user pressed
    [pressedquadrant setEnabled:NO];

    

    
    switch (player) {
        case 1:
            
            //write x for player 1 and O for player 2
            [pressedquadrant setTitle:@"X" forState:UIControlStateNormal];
            player = 2 ;
            // change player
            
            drawCount ++;
            break;
        case 2:
            [pressedquadrant setTitle:@"O" forState:UIControlStateNormal];
            player = 1;
            drawCount ++;
            break;
        default:
            exit(0);
            break;
    }
    
    
    //turn is over; check for winner
    [self checkforWinCases];
    if(drawCount == 9){
        // all moves made, no win , thous draw
        NSLog(@"Draw");
        
        NSString *message3 = [NSString stringWithFormat:@"We have a Draw! Nobody won! please try again %@ , %@", PlayerName1, PlayerName2];
        UIAlertView *alert5 = [[UIAlertView alloc]initWithTitle: @"Rough Game! "
                                                        message: message3
                                                       delegate: self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert5 setTag:5];
        [alert5 show];
        [self resetQuadrants];
    }
}

-(void) askForPlayerName
{
    //clearing up text fields
    Player1TextField =nil;
    Player2TextField =nil;
    
//    //cleanging label name
//    PlayernameLabel1 =nil;
//    PlayerNamelabel2 =nil;
    
    EnterNameView.hidden =NO;
    
    
    
}


- (IBAction)DonButtonTAP:(id)sender {
    //check if something is enetered
   
        if (Player1TextField.text.length ==0) {
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
        PlayerName1 = Player1TextField.text;
    }
        
        if (Player2TextField.text.length == 0){
            
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
        PlayerName2 = Player2TextField.text;
    }

    NSLog(@"Player 1 names is: %@", PlayerName1);
    NSLog(@"Player 2 names is: %@", PlayerName2);
    
    //Set the names
    [PlayernameLabel1 setText:PlayerName1];
  //  [PlayernameLabel1 setText:[NSString stringWithFormat:@"%@ Plays with X", PlayerName1]];
    [PlayerNamelabel2 setText:PlayerName2];
  //  [PlayerNamelabel2 setText:[NSString stringWithFormat:@"%@ Plays with O", PlayerName2]];

    
    EnterNameView.hidden = YES;
    

}

// get rid of the keyboard on return clicked !!! cant make it work
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
