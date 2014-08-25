//
//  ViewController.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createNewList:(id)sender {
    alert = [[AlertViewControler alloc] init];
    alert.delegate = self;
    MZFormSheetController *fsc = [[MZFormSheetController alloc] initWithViewController:alert];
    fsc.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsMoveToTop;
    fsc.shouldCenterVertically = YES;
    [fsc presentAnimated:YES completionHandler:nil];
}

-(IBAction)showLists:(id)sender{
    
}

-(IBAction)consultItens:(id)sender{
    
}

-(void)confirmPressed{
    NSString *listTitle = alert.formText;
    ListItensModel *listModel = [ListManager createListWithTitle:listTitle];
    [[ListManager sharedInstance] setCurrentList:listModel];
    [self pushInNavigationControllerThisControllerName:SBList];
}

@end
