//
//  FirstViewController.h
//  PassingData
//
//  Created by Tim McHale on 5/22/14.
//  Copyright (c) 2014 Gramercy Consultants. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "Country.h"

//implements the second viewcontrollers "PassInformation" protocol
@interface FirstViewController : UIViewController <PassInformation>
{
    IBOutlet UITextField *countryCode;
    IBOutlet UITextField *countryName;
}

@property (nonatomic, retain) SecondViewController *secondViewController;
@property Country *country;

@property (nonatomic, retain) IBOutlet UITextField *countryCode;
@property (nonatomic, retain) IBOutlet UITextField *countryName;

@end


