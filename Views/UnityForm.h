//
//  UnityForm.h
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnityForm : UIView{

}

@property (nonatomic, weak) UITextField *quantityField;
@property (nonatomic, weak) IBOutlet UIButton *decreaseQuantityButton;
@property (nonatomic, weak) IBOutlet UIButton *increaseQuantityButton;
@property (nonatomic, weak) IBOutlet UITextField *priceField;

- (IBAction)decreaseQuantityAction:(id)sender;
- (IBAction)increaseQuantityAction:(id)sender;

@end
