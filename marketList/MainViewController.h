//
//  ViewController.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <AlertViewControlerDelegate>{
    AlertViewControler *alert;
}

- (IBAction)createNewList:(id)sender;
- (IBAction)showLists:(id)sender;
- (IBAction)consultItens:(id)sender;

@end
