//
//  ListItemCell.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListItemCell : UITableViewCell{
    SpentItemModel *spentItem;
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UIImageView *categoryImage;
    __weak IBOutlet UILabel *categoryLabel;
    __weak IBOutlet UILabel *brandLabel;
    
    __weak IBOutlet UILabel *totalPriceLabel;
    __weak IBOutlet UILabel *quantityLabel;
    __weak IBOutlet UILabel *priceUnityLabel;
    
    __weak IBOutlet UILabel *totalGrams;
    __weak IBOutlet UILabel *priceKg;
    __weak IBOutlet UILabel *priceGramsSpent;
}

@property (nonatomic) SpentItemModel *spentItem;

-(void)setSpentItem:(SpentItemModel *)_spentItem;

@end
