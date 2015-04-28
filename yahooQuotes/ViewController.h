#import <UIKit/UIKit.h>

// added the UITextFieldDelegate
@interface ViewController : UIViewController<UITextFieldDelegate>


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

