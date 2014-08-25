//
//  IncludeItemViewController.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoCompleteView.h"

@interface IncludeItemViewController : UIViewController<UITextFieldDelegate>{
    
    __weak IBOutlet UIButton *saveUpdateButton;
    __weak IBOutlet UITextField *productNameLabel;
    __weak IBOutlet UITextField *quantityLabel;
    __weak IBOutlet UIButton *decreaseQuantityButton;
    __weak IBOutlet UIButton *increaseQuantityButton;
    __weak IBOutlet UITextField *priceLabel;
    __weak IBOutlet UITextField *brandLabel;
    __weak IBOutlet UIImageView *categoryImage;
    __weak IBOutlet UILabel *categoryLabel;
    __weak IBOutlet UIScrollView *scrollView;
    AutoCompleteView *autoCompleteView;
    CGRect originalScrollViewRect;
}
- (IBAction)back:(id)sender;
- (IBAction)saveUpdateAction:(id)sender;
- (IBAction)decreaseQuantityAction:(id)sender;
- (IBAction)increaseQuantityAction:(id)sender;
- (IBAction)chooseCategory:(id)sender;

@end
