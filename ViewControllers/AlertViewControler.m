//
//  AlertViewControler.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "AlertViewControler.h"

@interface AlertViewControler ()

@end

@implementation AlertViewControler
@synthesize delegate, formText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    originalFrame = self.view.frame;
    originalCenter = self.view.center;
    NSLog(@"%f",self.view.bounds.size.height);
    NSLog(@"%f",self.view.frame.size.height);
    [warningLabel setHidden:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    
    [self mz_dismissFormSheetControllerAnimated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        if ([delegate respondsToSelector:@selector(cancelPressed)]) {
            [delegate cancelPressed];
        }
    }];
}

- (IBAction)confirm:(id)sender {
    
    formText = formField.text;
    if ([NSString isStringEmpty:formText]) {
        [self showWarning];
        return;
    }
    [self mz_dismissFormSheetControllerAnimated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        if ([delegate respondsToSelector:@selector(confirmPressed)]) {
            [delegate confirmPressed];
        }
    }];
}

-(void)showWarning{
    warningLabel.text = @"O campo titulo deve ser preenchido";
    [warningLabel setHidden:NO];
}

-(id)init{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
   
    self.view.bounds = originalFrame;
    self.view.frame = originalFrame;
    self.view.center = originalCenter;
    
    NSLog(@"%f",self.view.bounds.size.height);
    NSLog(@"%f",self.view.frame.size.height);
}



@end
