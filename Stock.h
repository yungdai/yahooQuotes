//
//  Stock.h
//  yahooQuotes
//
//  Created by Yung Dai on 2015-04-28.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Stock : NSObject<UITextFieldDelegate>
// this app will require the three following things
// UITextField
@property (strong, nonatomic) UITextField *textField;

// String
@property (strong, nonatomic) NSString *quotes;

// UILabel
@property (strong, nonatomic) UILabel *myLabel;

// quote method instantiated
- (void)getQuote;


@end
