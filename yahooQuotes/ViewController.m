//
//  ViewController.m
//  yahooQuotes
//
//  Created by Yung Dai on 2015-04-27.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create the textField
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, 280, 20)];
    self.textField.text = @"AAPL";
    [self.view addSubview:_textField];
    
    // create the label
    self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];
    self.myLabel.text = @"$0.0";
    [self.view addSubview:_myLabel];
    
    // create the button
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(20, 200, 280, 40);
    [myButton setTitle:@"Get Quote" forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(getQuote) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton];
    
    
}

- (void)getQuote {
    
    // http://download.finance.yahoo.com/d/quotes.csv?s=%@&f=sl1d1t1c1ohgv&e=.csv
    NSString *quoteAddress = [NSString stringWithFormat:@"http://download.finance.yahoo.com/d/quotes.csv?s=%@&f=sl1d1t1c1ohgv&e=.csv", _textField.text];
    // create a URL to work with this webservice!
    
    // stringByAddingPrecentEscapesUningEncoding is parsing the URL into ascii encoding
    NSURL *theURL = [[NSURL alloc]initWithString:[quoteAddress stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    // take the URL string encode it and then encode it into an URL request
    NSURLRequest *theRequest = [[NSURLRequest alloc]initWithURL:theURL];

    
    // create a response
    NSURLResponse *response = nil;
    
    // how to deal with an error
    NSError *error = nil;
    
    // setting up the data
    NSData *data = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:&error];
    
    // select the correct type of encoding to use with the string for the web
    NSMutableString *contentString = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // create a data structure for the values you recieves from the Yahoo API and have them put into an array but parse the data and tell that it's separated by a comma
    NSArray *arrayData = [contentString componentsSeparatedByString:@","];
    
    // displaying the data from the array
     _myLabel.text = [arrayData objectAtIndex:1];

    // show in the console the string recieved from the Yahoo website API
    NSLog(@"The price of the stock is %@", contentString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
