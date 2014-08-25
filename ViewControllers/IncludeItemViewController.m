//
//  IncludeItemViewController.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "IncludeItemViewController.h"

@interface IncludeItemViewController ()

@end

@implementation IncludeItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    originalScrollViewRect = scrollView.frame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addObservers];
    [[self navigationController] setNavigationBarHidden:YES];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    priceLabel.inputAccessoryView = numberToolbar;
    
    autoCompleteView = [Utils loadNibForName:@"AutoCompleteView"];
    
    // Do any additional setup after loading the view.
}

-(void)addObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidAppear:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

-(void)keyboardDidAppear:(NSNotification*)notification{
    CGRect keyboardRect = keyboardRect(notification);
    CGRect newRect = scrollView.frame;
    newRect.size.height = newRect.size.height - keyboardRect.size.height;
    scrollView.frame = newRect;
    scrollView.contentSize = originalScrollViewRect.size;
}

-(void)keyboardDidHide:(NSNotification*)notification{
    scrollView.frame = originalScrollViewRect;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doneWithNumberPad{
    [priceLabel resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveUpdateAction:(id)sender {
}

- (IBAction)decreaseQuantityAction:(id)sender {
    int qtd = [quantityLabel.text intValue];
    if (qtd == 0) {
        return;
    }
    qtd--;
    quantityLabel.text = [NSString stringWithFormat:@"%i",qtd];
}

- (IBAction)increaseQuantityAction:(id)sender {
    int qtd = [quantityLabel.text intValue];
    qtd++;
    quantityLabel.text = [NSString stringWithFormat:@"%i",qtd];
}

- (IBAction)chooseCategory:(id)sender {
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [autoCompleteView removeFromSuperview];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([NSString isStringEmpty:string] && range.location == 0) {
        [autoCompleteView removeFromSuperview];
        return YES;
    }
    
    NSString *desireWord = [NSString stringWithFormat:@"%@%@",textField.text,string];
    
    if (textField == productNameLabel) {
        [autoCompleteView populateProductNameWithDesireWord:desireWord];
        [self addAutocompleteViewInView:textField AndAbove:NO];
    }else if (textField == brandLabel){
        [autoCompleteView populateBrandNameWithDesireWord:desireWord];
        [self addAutocompleteViewInView:textField AndAbove:YES];
    }
    
    return YES;
}

-(void)addAutocompleteViewInView:(UIView*)view AndAbove:(BOOL)above{
    CGRect frame = autoCompleteView.frame;;
    frame.origin = view.frame.origin;
    frame.size.width = view.frame.size.width;
    
    if (above) {
        frame.origin.y = frame.origin.y - frame.size.height;
    }else{
        frame.origin.y = frame.origin.y + view.frame.size.height;
    }
    
    
    autoCompleteView.frame = frame;
    [self.view addSubview:autoCompleteView];
}


@end
