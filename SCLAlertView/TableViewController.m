//
//  TableViewController.m
//  SCLAlertView
//
//  Created by zhaozq on 2017/12/8.
//  Copyright © 2017年 AnyKey Entertainment. All rights reserved.
//

#import "TableViewController.h"
#import "SCLAlertView.h"
@interface TableViewController ()

@end

NSString *kSuccessTitle = @"Congratulations";
NSString *kErrorTitle = @"Connection error";
NSString *kNoticeTitle = @"Notice";
NSString *kWarningTitle = @"Warning";
NSString *kInfoTitle = @"Info";
NSString *kSubtitle = @"You've just displayed this awesome Pop Up View";
NSString *kButtonTitle = @"Done";
NSString *kAttributeTitle = @"Attributed string operation successfully completed.";

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (IBAction)showSuccess:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    
    SCLButton *button = [alert addButton:@"First Button" target:self selector:@selector(firstButton)];
    
    button.buttonFormatBlock = ^NSDictionary* (void)
    {
        NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
        
        buttonConfig[@"backgroundColor"] = [UIColor whiteColor];
        buttonConfig[@"textColor"] = [UIColor blackColor];
        buttonConfig[@"borderWidth"] = @2.0f;
        buttonConfig[@"borderColor"] = [UIColor greenColor];
        
        return buttonConfig;
    };
    
    [alert addButton:@"Second Button" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [NSBundle mainBundle].resourcePath]];
    
    [alert showSuccess:kSuccessTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showSuccessWithHorizontalButtons:(id)sender {
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    [alert setHorizontalButtons:YES];
    
    SCLButton *button = [alert addButton:@"First Button" target:self selector:@selector(firstButton)];
    
    button.buttonFormatBlock = ^NSDictionary* (void)
    {
        NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
        
        buttonConfig[@"backgroundColor"] = [UIColor whiteColor];
        buttonConfig[@"textColor"] = [UIColor blackColor];
        buttonConfig[@"borderWidth"] = @2.0f;
        buttonConfig[@"borderColor"] = [UIColor greenColor];
        
        return buttonConfig;
    };
    
    [alert addButton:@"Second Button" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [NSBundle mainBundle].resourcePath]];
    
    [alert showSuccess:kSuccessTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showError:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showError:self title:@"Hold On..."
            subTitle:@"You have not saved your Submission yet. Please save the Submission before accessing the Responses list. Blah de blah de blah, blah. Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah."
    closeButtonTitle:@"OK" duration:0.0f];
}

- (IBAction)showNotice:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.backgroundType = SCLAlertViewBackgroundBlur;
    [alert showNotice:self title:kNoticeTitle subTitle:@"You've just displayed this awesome Pop Up View with blur effect" closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showWarning:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showWarning:self title:kWarningTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showInfo:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.shouldDismissOnTapOutside = YES;
    [alert alertIsDismissed:^{
        NSLog(@"SCLAlertView dismissed!");
    }];
    
    [alert showInfo:self title:kInfoTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showEdit:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    SCLTextView *textField = [alert addTextField:@"Enter your name"];
    [alert addButton:@"Show Name" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    [alert showEdit:self title:kInfoTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showEditWithHorizontalButtons:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    [alert setHorizontalButtons:YES];
    
    SCLTextView *textField = [alert addTextField:@"Enter your name"];
    alert.hideAnimationType = SCLAlertViewHideAnimationSimplyDisappear;
    [alert addButton:@"Show Name" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    [alert showEdit:self title:kInfoTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showAdvanced:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.backgroundViewColor = [UIColor cyanColor];
    
    [alert setTitleFontFamily:@"Superclarendon" withSize:20.0f];
    [alert setBodyTextFontFamily:@"TrebuchetMS" withSize:14.0f];
    [alert setButtonsTextFontFamily:@"Baskerville" withSize:14.0f];
    
    [alert addButton:@"First Button" target:self selector:@selector(firstButton)];
    
    [alert addButton:@"Second Button" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    SCLTextView *textField = [alert addTextField:@"Enter your name"];
    
    [alert addButton:@"Show Name" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    alert.completeButtonFormatBlock = ^NSDictionary* (void)
    {
        NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
        
        buttonConfig[@"backgroundColor"] = [UIColor greenColor];
        buttonConfig[@"borderColor"] = [UIColor blackColor];
        buttonConfig[@"borderWidth"] = @"1.0f";
        buttonConfig[@"textColor"] = [UIColor blackColor];
        
        return buttonConfig;
    };
    
    alert.attributedFormatBlock = ^NSAttributedString* (NSString *value)
    {
        NSMutableAttributedString *subTitle = [[NSMutableAttributedString alloc]initWithString:value];
        
        NSRange redRange = [value rangeOfString:@"Attributed" options:NSCaseInsensitiveSearch];
        [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
        
        NSRange greenRange = [value rangeOfString:@"successfully" options:NSCaseInsensitiveSearch];
        [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor brownColor] range:greenRange];
        
        NSRange underline = [value rangeOfString:@"completed" options:NSCaseInsensitiveSearch];
        [subTitle addAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)} range:underline];
        
        return subTitle;
    };
    
    [alert showTitle:self title:@"Congratulations" subTitle:kAttributeTitle style:SCLAlertViewStyleSuccess closeButtonTitle:@"Done" duration:0.0f];
}

- (IBAction)ShowAdvancedWithHorizontalButtons:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    [alert setHorizontalButtons:YES];
    
    alert.backgroundViewColor = [UIColor cyanColor];
    
    [alert setTitleFontFamily:@"Superclarendon" withSize:20.0f];
    [alert setBodyTextFontFamily:@"TrebuchetMS" withSize:14.0f];
    [alert setButtonsTextFontFamily:@"Baskerville" withSize:14.0f];
    
    [alert addButton:@"First Button" target:self selector:@selector(firstButton)];
    
    [alert addButton:@"Second Button" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    SCLTextView *textField = [alert addTextField:@"Enter your name"];
    
    [alert addButton:@"Show Name" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    alert.completeButtonFormatBlock = ^NSDictionary* (void)
    {
        NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
        
        buttonConfig[@"backgroundColor"] = [UIColor greenColor];
        buttonConfig[@"borderColor"] = [UIColor blackColor];
        buttonConfig[@"borderWidth"] = @"1.0f";
        buttonConfig[@"textColor"] = [UIColor blackColor];
        
        return buttonConfig;
    };
    
    alert.attributedFormatBlock = ^NSAttributedString* (NSString *value)
    {
        NSMutableAttributedString *subTitle = [[NSMutableAttributedString alloc]initWithString:value];
        
        NSRange redRange = [value rangeOfString:@"Attributed" options:NSCaseInsensitiveSearch];
        [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
        
        NSRange greenRange = [value rangeOfString:@"successfully" options:NSCaseInsensitiveSearch];
        [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor brownColor] range:greenRange];
        
        NSRange underline = [value rangeOfString:@"completed" options:NSCaseInsensitiveSearch];
        [subTitle addAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)} range:underline];
        
        return subTitle;
    };
    
    [alert showTitle:self title:@"Congratulations" subTitle:kAttributeTitle style:SCLAlertViewStyleSuccess closeButtonTitle:@"Done" duration:0.0f];
}

- (IBAction)showWithDuration:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showNotice:self title:kNoticeTitle subTitle:@"You've just displayed this awesome Pop Up View with 5 seconds duration" closeButtonTitle:nil duration:5.0f];
}

- (IBAction)showCustom:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    UIColor *color = [UIColor colorWithRed:65.0/255.0 green:64.0/255.0 blue:144.0/255.0 alpha:1.0];
    [alert showCustom:self image:[UIImage imageNamed:@"git"] color:color title:@"Custom" subTitle:@"Add a custom icon and color for your own type of alert!" closeButtonTitle:@"OK" duration:0.0f];
}

- (IBAction)showValidation:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    SCLTextView *evenField = [alert addTextField:@"Enter an even number"];
    evenField.keyboardType = UIKeyboardTypeNumberPad;
    
    SCLTextView *oddField = [alert addTextField:@"Enter an odd number"];
    oddField.keyboardType = UIKeyboardTypeNumberPad;
    
    [alert addButton:@"Test Validation" validationBlock:^BOOL{
        if (evenField.text.length == 0)
        {
            [[[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"You forgot to add an even number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [evenField becomeFirstResponder];
            return NO;
        }
        
        if (oddField.text.length == 0)
        {
            [[[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"You forgot to add an odd number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [oddField becomeFirstResponder];
            return NO;
        }
        
        NSInteger evenFieldEntry = (evenField.text).integerValue;
        BOOL evenFieldPassedValidation = evenFieldEntry % 2 == 0;
        
        if (!evenFieldPassedValidation)
        {
            [[[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"That is not an even number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [evenField becomeFirstResponder];
            return NO;
        }
        
        NSInteger oddFieldEntry = (oddField.text).integerValue;
        BOOL oddFieldPassedValidation = oddFieldEntry % 2 == 1;
        
        if (!oddFieldPassedValidation)
        {
            [[[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"That is not an odd number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [oddField becomeFirstResponder];
            return NO;
        }
        return YES;
    } actionBlock:^{
        [[[UIAlertView alloc] initWithTitle:@"Great Job!" message:@"Thanks for playing." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
    
    [alert showEdit:self title:@"Validation" subTitle:@"Ensure the data is correct before dismissing!" closeButtonTitle:@"Cancel" duration:0];
}

- (IBAction)showValidationWithHorizontalButtons:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    [alert setHorizontalButtons:YES];
    
    SCLTextView *evenField = [alert addTextField:@"Enter an even number"];
    evenField.keyboardType = UIKeyboardTypeNumberPad;
    
    SCLTextView *oddField = [alert addTextField:@"Enter an odd number"];
    oddField.keyboardType = UIKeyboardTypeNumberPad;
    
    [alert addButton:@"Test Validation" validationBlock:^BOOL{
        if (evenField.text.length == 0)
        {
            [[[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"You forgot to add an even number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [evenField becomeFirstResponder];
            return NO;
        }
        
        if (oddField.text.length == 0)
        {
            [[[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"You forgot to add an odd number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [oddField becomeFirstResponder];
            return NO;
        }
        
        NSInteger evenFieldEntry = (evenField.text).integerValue;
        BOOL evenFieldPassedValidation = evenFieldEntry % 2 == 0;
        
        if (!evenFieldPassedValidation)
        {
            [[[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"That is not an even number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [evenField becomeFirstResponder];
            return NO;
        }
        
        NSInteger oddFieldEntry = (oddField.text).integerValue;
        BOOL oddFieldPassedValidation = oddFieldEntry % 2 == 1;
        
        if (!oddFieldPassedValidation)
        {
            [[[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"That is not an odd number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            [oddField becomeFirstResponder];
            return NO;
        }
        return YES;
    } actionBlock:^{
        [[[UIAlertView alloc] initWithTitle:@"Great Job!" message:@"Thanks for playing." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
    
    [alert showEdit:self title:@"Validation" subTitle:@"Ensure the data is correct before dismissing!" closeButtonTitle:@"Cancel" duration:0];
}

- (IBAction)showWaiting:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.showAnimationType = SCLAlertViewHideAnimationSlideOutToCenter;
    alert.hideAnimationType = SCLAlertViewHideAnimationSlideOutFromCenter;
    
    alert.backgroundType = SCLAlertViewBackgroundTransparent;
    
    [alert showWaiting:self title:@"Waiting..."
              subTitle:@"You've just displayed this awesome Pop Up View with transparent background"
      closeButtonTitle:nil duration:5.0f];
}

- (IBAction)showTimer:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    [alert addTimerToButtonIndex:0 reverse:YES];
    [alert showInfo:self title:@"Countdown Timer"
           subTitle:@"This alert has a duration set, and a countdown timer on the Dismiss button to show how long is left."
   closeButtonTitle:@"Dismiss" duration:10.0f];
}

- (IBAction)showQuestion:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showQuestion:self title:@"Question?" subTitle:kSubtitle closeButtonTitle:@"Dismiss" duration:0.0f];
}

- (IBAction)showSwitch:(id)sender {
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    alert.tintTopCircle = NO;
    alert.iconTintColor = [UIColor brownColor];
    alert.useLargerIcon = YES;
    alert.cornerRadius = 13.0f;
    
    [alert addSwitchViewWithLabel:@"Don't show again".uppercaseString];
    [[SCLSwitchView appearance] setTintColor:[UIColor brownColor]];
    
    SCLButton *button = [alert addButton:@"Done" target:self selector:@selector(firstButton)];
    
    button.buttonFormatBlock = ^NSDictionary* (void) {
        NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
        buttonConfig[@"cornerRadius"] = @"17.5f";
        
        return buttonConfig;
    };
    
    [alert showCustom:self image:[UIImage imageNamed:@"switch"] color:[UIColor brownColor] title:kInfoTitle subTitle:kSubtitle closeButtonTitle:nil duration:0.0f];
}

- (void)firstButton
{
    NSLog(@"First button tapped");
}

- (IBAction)showWithButtonCustom:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    
    SCLButton *button = [alert addButton:@"First Button" target:self selector:@selector(firstButton)];
    
    button.buttonFormatBlock = ^NSDictionary* (void)
    {
        NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
        
        buttonConfig[@"backgroundColor"] = [UIColor whiteColor];
        buttonConfig[@"textColor"] = [UIColor blackColor];
        buttonConfig[@"borderWidth"] = @2.0f;
        buttonConfig[@"borderColor"] = [UIColor greenColor];
        buttonConfig[@"font"] = [UIFont fontWithName:@"ComicSansMS" size:13];
        
        return buttonConfig;
    };
    
    [alert addButton:@"Second Button" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [NSBundle mainBundle].resourcePath]];
    
    [alert showSuccess:kSuccessTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 19;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self showSuccess:nil];
            break;
        case 1:
            [self showSuccessWithHorizontalButtons:nil];
            break;
        case 2:
            [self showError:nil];
            break;
        case 3:
            [self showNotice:nil];
            break;
        case 4:
            [self showWarning:nil];
            break;
        case 5:
            [self showInfo:nil];
            break;
        case 6:
            [self showEdit:nil];
            break;
        case 7:
            [self showEditWithHorizontalButtons:nil];
            break;
        case 8:
            [self showAdvanced:nil];
            break;
        case 9:
            [self ShowAdvancedWithHorizontalButtons:nil];
            break;
        case 10:
            [self showWithDuration:nil];
            break;
        case 11:
            [self showCustom:nil];
            break;
        case 12:
            [self showValidation:nil];
            break;
        case 13:
            [self showValidationWithHorizontalButtons:nil];
            break;
        case 14:
            [self showWaiting:nil];
            break;
        case 15:
            [self showTimer:nil];
            break;
        case 16:
            [self showQuestion:nil];
            break;
        case 17:
            [self showSwitch:nil];
            break;
        case 18:
            [self showWithButtonCustom:nil];
            break;
        default:
            break;
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
