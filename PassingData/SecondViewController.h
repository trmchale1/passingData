//
//  SecondViewController.h
//  PassingData
//
//  Created by Tim McHale on 5/22/14.
//  Copyright (c) 2014 Gramercy Consultants. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Country.h"


//create this protocol so that we can pass information back
@protocol PassInformation <NSObject>

@optional

-(void) setScreenValues:(Country *)myCountry;

@end

@interface SecondViewController : UIViewController

@property Country *country;

@property UITextField *countryCode;
@property UITextField *countryName;

//define the delegate property
@property (nonatomic, unsafe_unretained) id<PassInformation> delegate;

@end