//
//  PendingItensViewController.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PendingItensViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    __weak IBOutlet UIButton *leftButton;
    __weak IBOutlet UIButton *rigthButton;
    __weak IBOutlet UITableView *pendingTableView;
    
    NSArray *pendingList;
}

@property (nonatomic) NSArray *pendingList;

- (IBAction)leftButtonAction:(id)sender;
- (IBAction)rigthButtonAction:(id)sender;

@end
