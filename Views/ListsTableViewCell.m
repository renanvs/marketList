//
//  ListsTableViewCell.m
//  marketList
//
//  Created by renan veloso silva on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "ListsTableViewCell.h"

@implementation ListsTableViewCell

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

-(void)setupCellWithListItens:(ListItensModel*)_listItensModel{
    listName.text = _listItensModel.name;
    SpentItensCount.text = [NSString stringWithFormat:@"%i itens",_listItensModel.spentItens.count];
    price.text = [self sumItens:[_listItensModel.spentItens allObjects]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy HH:mm";
    date.text = [dateFormatter stringFromDate:_listItensModel.date];
    marketName.text = _listItensModel.market.name;
}

-(NSString*)sumItens:(NSArray*)listSpentItens{
    float sum = 0;
    for (SpentItemModel *spentItemModel in listSpentItens) {
        if ([spentItemModel.valueKg floatValue] > 0 ) {
            float priceValue = ([spentItemModel.valueKg floatValue] * [spentItemModel.quantityGrams floatValue])/1000;
            sum = sum + priceValue;
        }else{
            sum = sum + [spentItemModel.valueUnity floatValue] * [spentItemModel.quantity floatValue];
        }
    }
    
    return [NSString stringWithFormat:@"R$ %.2f",sum];
}

@end
