//
//  ListViewController.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>{
    
    __weak IBOutlet UIButton *buyingButton;
    __weak IBOutlet UILabel *totalLabel;
    __weak IBOutlet UIButton *saveButton;
    __weak IBOutlet UILabel *listName;
    __weak IBOutlet UITableView *listItemTableView;
    float cellHeight;
    ListItensModel *currentList;
    NSArray *spentList;
}
- (IBAction)back:(id)sender;
- (IBAction)buyingAction:(id)sender;
- (IBAction)IncludeItem:(id)sender;
- (IBAction)saveAction:(id)sender;

@end
