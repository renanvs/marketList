//
//  ListItemCell.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "ListItemCell.h"

@implementation ListItemCell
@synthesize spentItem;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setSpentItem:(SpentItemModel *)_spentItem{
    nameLabel.text = _spentItem.item.name;
    categoryImage.image = [UIImage imageNamed:@"sample_food"];
    categoryLabel.text = _spentItem.item.category.name;
    
    if ([_spentItem.type isEqualToString:SpentTypeUnique]) {
        priceUnityLabel.text = [NSString stringWithFormat:@"R$ %.2f", [_spentItem.valueUnity floatValue]];
        totalPriceLabel.text = [NSString stringWithFormat:@"R$ %.2f", ([_spentItem.valueUnity floatValue]*[_spentItem.quantity floatValue])];
        NSString *quantityStr = nil;
        if ([_spentItem.quantity integerValue]> 1) {
            quantityStr = [NSString stringWithFormat:@"%@ unidades", [_spentItem.quantity stringValue]];
        }else{
            quantityStr = [NSString stringWithFormat:@"%@ unidade", [_spentItem.quantity stringValue]];
        }
        quantityLabel.text = quantityStr;
    }else{
        priceKg.text = [NSString stringWithFormat:@"R$ %.2f", [_spentItem.valueKg floatValue]];
        
        float gramsSpent = ([_spentItem.valueKg floatValue] * [_spentItem.quantityGrams floatValue])/1000;
        priceGramsSpent.text = [NSString stringWithFormat:@"R$ %.2f", gramsSpent];
        
        totalGrams.text = [NSString stringWithFormat:@"%@ gramas", [_spentItem.quantityGrams stringValue]];
        
    }
    
    brandLabel.text = _spentItem.item.brand.name;
    
}

@end
