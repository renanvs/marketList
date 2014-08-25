//
//  AlertViewControler.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZFormSheetController.h"

@protocol AlertViewControlerDelegate <NSObject>

@optional
-(void)confirmPressed;
-(void)cancelPressed;

@end

@interface AlertViewControler : UIViewController{
    
    __weak IBOutlet UILabel *alertTitle;
    __weak IBOutlet UILabel *description;
    __weak IBOutlet UILabel *warningLabel;
    __weak IBOutlet UITextField *formField;
    
    id <AlertViewControlerDelegate> delegate;
    
    CGRect originalFrame;
    CGPoint originalCenter;
    
    NSString *formText;
}

@property (strong, nonatomic) id <AlertViewControlerDelegate> delegate;
@property (nonatomic) NSString *formText;

- (IBAction)cancel:(id)sender;
- (IBAction)confirm:(id)sender;

@end
