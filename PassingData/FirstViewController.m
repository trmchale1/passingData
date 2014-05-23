//
//  FirstViewController.m
//  PassingData
//
//  Created by Tim McHale on 5/22/14.
//  Copyright (c) 2014 Gramercy Consultants. All rights reserved.
//



#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize countryCode,countryName;
@synthesize country;
@synthesize secondViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        country = [[Country alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"First view did load");
    // Do any additional setup after loading the view.
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"First View"];
    
    //set the background color of the view
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    //create a text field for our country code and add to the view
    countryCode = [[UITextField alloc] init];
    [countryCode setBorderStyle: UITextBorderStyleRoundedRect];
    [countryCode setFrame:CGRectMake(10.0,10.0,200.0,30.0)];
    [countryCode setPlaceholder:@"Enter Country Code here"];
    [self.view addSubview: countryCode];
    
    //create a text field for our country name and add to the view
    countryName = [[UITextField alloc] init];
    [countryName setBorderStyle: UITextBorderStyleRoundedRect];
    [countryName setFrame:CGRectMake(10.0,50.0,200.0,30.0)];
    [countryName setPlaceholder:@"Enter Country Name here"];
    [self.view addSubview: countryName];
    
    //create a button so that when user clicks we can go to the next view
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(goToNextView:)
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Next View" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor darkGrayColor]];
    button.frame = CGRectMake(10.0, 90.0, 200.0, 30.0);
    [self.view addSubview:button];
    
    
    
}

//action method linked to the button, gets called on the touchdown event
- (void) goToNextView:(id)sender {
    
    //get reference to the button that requested the action
    UIButton *button = (UIButton *)sender;
    
    //check which button it is, if you have more than one button on the screen
    //you must check before taking necessary action
    if([button.currentTitle isEqualToString:@"Next View"]){
        NSLog(@"Clicked on the button");
        
        //if the second view controller doesn't exists create it
        if(self.secondViewController == nil){
            SecondViewController *secondView = [[SecondViewController alloc] init];
            self.secondViewController = secondView;
        }
        
        //set this view as the second viewcobntroller's delegate so that it can listen for events
        [secondViewController setDelegate:self];
        
        //save the country object with screen values
        country.code = countryCode.text;
        country.name = countryName.text;
        
        //set the country object of the second view controller
        [self.secondViewController setCountry:country];
        
        //tell the navigation controller to push a new view into the stack
        [self.navigationController pushViewController:self.secondViewController animated:YES];
        
    }
    
}

//before the view appears check the country object and set the screen values
- (void) viewWillAppear:(BOOL)animated {
    
    NSLog(@"First View will appear");
    [countryCode setText:country.code];
    [countryName setText:country.name];
    
}

//delegate function implemented
//this gets called from the second viewconroller when the view disappears
- (void) setScreenValues:(Country *)myCountry
{
    self.country = myCountry;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
