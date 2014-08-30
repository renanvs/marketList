//
//  ListsTableViewCell.h
//  marketList
//
//  Created by renan veloso silva on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListsTableViewCell : UITableViewCell{
    
    __weak IBOutlet UILabel *listName;
    __weak IBOutlet UILabel *SpentItensCount;
    __weak IBOutlet UILabel *price;
    __weak IBOutlet UILabel *date;
    __weak IBOutlet UILabel *marketName;
}

-(void)setupCellWithListItens:(ListItensModel*)_listItensModel;

@end
