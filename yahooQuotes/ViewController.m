#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create the textField
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, 280, 20)];
    self.textField.text = @"AAPL";

    
    // disable autocorrection and the return key
    self.textField.autocapitalizationType = UITextAutocorrectionTypeNo;
    self.textField.returnKeyType = UIReturnKeyDone;
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
    
    // The Yahoo Stock API link served in CSV format.
    NSString *quoteAddress = [NSString stringWithFormat:@"http://download.finance.yahoo.com/d/quotes.csv?s=%@&f=sl1d1t1c1ohgv&e=.csv", _textField.text];
    // create a URL to work with this webservice!
    
    // stringByAddingPrecentEscapesUningEncoding is parsing the URL into ascii encoding this is a required function.
    NSURL *theURL = [[NSURL alloc]initWithString:[quoteAddress stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    // take the URL string encode it and then encode it into an URL request
    NSURLRequest *theRequest = [[NSURLRequest alloc]initWithURL:theURL];

    
    // create a response
    NSURLResponse *response = nil;
    
    // how to deal with an error
    NSError *error = nil;
    
    // setting up the data
    // the & represents the memory location of the data
    NSData *data = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:&error];
    
    // select the correct type of encoding to use with the string for the web UTF8 is required for all websites.
    NSMutableString *contentString = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // create a data structure for the values you recieves from the Yahoo API and have them put into an array but parse the data and tell that it's separated by a comma.  We are putting all the CSV data into an array separated by a comma.
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
