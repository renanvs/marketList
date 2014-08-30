//
//  IncludeItemViewController.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoCompleteView.h"
#import "UnityForm.h"
#import "WeightForm.h"
#import "CategorySelectorView.h"

typedef enum {
    PriceTypeUnity,
    PriceTypeWeight,
} PriceType;

@interface IncludeItemViewController : UIViewController<UITextFieldDelegate, CategorySelectorViewDelegate>{
    
    __weak IBOutlet UIButton *saveUpdateButton;
    
    __weak IBOutlet UIButton *unityButton;
    __weak IBOutlet UIButton *weigthButton;
    
    __weak IBOutlet UITextField *productNameLabel;
    
    __weak IBOutlet UITextField *brandLabel;
    __weak IBOutlet UIImageView *categoryImage;
    __weak IBOutlet UILabel *categoryLabel;
    __weak IBOutlet UIScrollView *scrollView;
    
    __weak IBOutlet UIView *priceTypeContainer;
    
    UnityForm *unityForm;
    WeightForm *weightForm;
    
    CategorySelectorView *categorySelectorView;
    
    ListItensModel *currentList;
    
    AutoCompleteView *autoCompleteView;
    CGRect originalScrollViewRect;
    
    PriceType priceType;
    
    SpentItemModel *spentItem;
    CategoryModel *currentCategory;
    ItemModel *currentItemModel;
    BrandModel *currentBrandModel;
    
    NSManagedObjectContext *ctx;
    
    SpentItemModel *spentItemModel;
}

@property (nonatomic) ListItensModel *currentList;
@property (nonatomic) SpentItemModel *spentItemModel;

- (IBAction)back:(id)sender;
- (IBAction)saveUpdateAction:(id)sender;
- (IBAction)chooseCategory:(id)sender;

- (IBAction)changePriceType:(id)sender;

@end
