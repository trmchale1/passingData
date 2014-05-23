//
//  SecondViewController.m
//  PassingData
//
//  Created by Tim McHale on 5/22/14.
//  Copyright (c) 2014 Gramercy Consultants. All rights reserved.
//
#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize countryCode,countryName;
@synthesize country;
@synthesize delegate;

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
    NSLog(@"Second view did load");
    // Do any additional setup after loading the view.
    
    [self.navigationItem setTitle:@"Second View"];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    countryCode = [[UITextField alloc] init];
    [countryCode setBorderStyle: UITextBorderStyleRoundedRect];
    [countryCode setFrame:CGRectMake(10.0,10.0,200.0,30.0)];
    [countryCode setPlaceholder:@"Enter Country Code here"];
    [self.view addSubview: countryCode];
    
    countryName = [[UITextField alloc] init];
    [countryName setBorderStyle: UITextBorderStyleRoundedRect];
    [countryName setFrame:CGRectMake(10.0,50.0,200.0,30.0)];
    [countryName setPlaceholder:@"Enter Country Name here"];
    [self.view addSubview: countryName];
    
    
}

- (void) viewWillAppear:(BOOL)animated {
    
    NSLog(@"Second View will appear");
    [countryCode setText:country.code];
    [countryName setText:country.name];
    
    
}


- (void) viewWillDisappear:(BOOL) animated {
    
    NSLog(@"Second View will disappear");
    country.code = countryCode.text;
    country.name = countryName.text;
    
    //Is anyone listening
    if([[self delegate] respondsToSelector:@selector(setScreenValues:)])
    {
        //send the delegate function with the country information
        [[self delegate] setScreenValues:country];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end