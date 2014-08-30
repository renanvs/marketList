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
    [[self navigationController] setNavigationBarHidden:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createNewList:(id)sender {
    alert = [[UIAlertView alloc] init];
    alert.title = @"www";
    alert.message = @"Qual o nome da lista;";
    [alert addButtonWithTitle:@"Ok"];
    [alert addButtonWithTitle:@"Cancelar"];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.delegate = self;
    
    [alert show];
}

-(IBAction)showLists:(id)sender{
    
}

-(IBAction)consultItens:(id)sender{
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        UITextField *tf = [alert textFieldAtIndex:0];
        NSString *listTitle = tf.text;
        ListItensModel *listModel = [ListManager createListWithTitle:listTitle];
        [[ListManager sharedInstance] setCurrentList:listModel];
        [self pushInNavigationControllerThisControllerName:SBList];
    }
}

-(void)confirmPressed{
    
}


@end
