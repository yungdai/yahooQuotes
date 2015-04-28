//
//  ViewController.h
//  yahooQuotes
//
//  Created by Yung Dai on 2015-04-27.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


// this app will require the three following things
// UITextField
@property (strong, nonatomic) UITextField *textField;

// String
@property (strong, nonatomic) NSString *quotes;

// UILabel
@property (strong, nonatomic) UILabel *myLabel;

@end

