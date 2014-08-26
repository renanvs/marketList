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

@synthesize currentList;

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
    [self addCorrectPriceView];
}

-(void)addCorrectPriceView{
    [unityForm removeFromSuperview];
    [weightForm removeFromSuperview];
    
    if (priceType == PriceTypeUnity) {
        [priceTypeContainer addSubview:unityForm];
    }else{
        [priceTypeContainer addSubview:weightForm];
    }
    [self adjustPriceButtonLayout];
}

- (IBAction)changePriceType:(id)sender{
    if (priceType == PriceTypeUnity) {
        priceType = PriceTypeWeight;
    }else{
        priceType = PriceTypeUnity;
    }
    [self adjustPriceButtonLayout];
    [self addCorrectPriceView];
}

-(void)adjustPriceButtonLayout{
    if (priceType == PriceTypeUnity) {
        [unityButton setBackgroundColor:[UIColor greenColor]];
        [weigthButton setBackgroundColor:[UIColor clearColor]];
    }else{
        [weigthButton setBackgroundColor:[UIColor greenColor]];
        [unityButton setBackgroundColor:[UIColor clearColor]];
    }
}

-(void)CategorySelectorViewClose{
    [categorySelectorView removeFromSuperview];
}

-(void)CategorySelectorViewDidSelectCategory:(CategoryModel *)category{
    currentCategory = category;
    NSString *imageName = [NSString isStringEmpty:category.imageName] ? @"sample_food" : category.imageName;
    categoryImage.image = [UIImage imageNamed:imageName];
    categoryLabel.text = category.name;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ctx = [NSManagedObjectContext MR_contextForCurrentThread];
    [self addObservers];
    [[self navigationController] setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    priceType = PriceTypeUnity;
    
    categorySelectorView = [Utils loadNibForName:@"CategorySelectorView"];
    categorySelectorView.delegate = self;
    
    weightForm = [Utils loadNibForName:@"WeightForm"];
    unityForm = [Utils loadNibForName:@"UnityForm"];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    
    unityForm.priceField.inputAccessoryView = numberToolbar;
    weightForm.priceKgField.inputAccessoryView = numberToolbar;
    weightForm.weightField.inputAccessoryView = numberToolbar;
    
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
    [unityForm.priceField resignFirstResponder];
    [weightForm.priceKgField resignFirstResponder];
    [weightForm.weightField resignFirstResponder];
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
    spentItem = [self createSpentItem];
    
    if (canSave) {
        [currentList addSpentItensObject:spentItem];
        [self back:nil];
    }else{
        
        [[[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Existem campos que devem ser preenchidos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
    
}

-(SpentItemModel*)createSpentItem{
    
    if ([NSString isStringEmpty:productNameLabel.text] || [NSString isStringEmpty:brandLabel.text]) {
        canSave = NO;
        return nil;
    }else{
        canSave = YES;
    }
    
    
    spentItem = [SpentItemModel MR_createInContext:ctx];
    if (priceType == PriceTypeUnity) {
        spentItem.type = SpentTypeUnique;
    }else{
        spentItem.type = SpentTypeWeight;
    }
    
    spentItem.quantity = [NSNumber numberWithInt:[unityForm.quantityField.text intValue]];
    spentItem.quantityGrams = [NSNumber numberWithFloat:[weightForm.weightField.text floatValue]];
    spentItem.valueKg = [NSNumber numberWithFloat:[weightForm.priceKgField.text floatValue]];
    spentItem.valueUnity = [NSNumber numberWithFloat:[unityForm.priceField.text floatValue]];
    
    if (!currentItemModel) {
        currentItemModel = [ItemModel MR_createInContext:ctx];
        currentItemModel.name = productNameLabel.text;
        if (!currentBrandModel) {
            currentBrandModel = [BrandModel MR_createInContext:ctx];
            currentBrandModel.name = brandLabel.text;
        }
        if (!currentCategory) {
            currentCategory = [[ListManager sharedInstance] getDefaultCategory];
        }
        
        currentItemModel.brand = currentBrandModel;
        currentItemModel.category = currentCategory;
    }
    
    spentItem.item = currentItemModel;
    
    
    
    
    return spentItem;
}

- (IBAction)chooseCategory:(id)sender {
    [categorySelectorView removeFromSuperview];
    categorySelectorView.frame = self.view.frame;
    [self.view addSubview:categorySelectorView];
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
