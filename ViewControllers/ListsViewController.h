//
//  ListsViewController.h
//  marketList
//
//  Created by renan veloso silva on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    __weak IBOutlet UITableView *table;
}

@end
