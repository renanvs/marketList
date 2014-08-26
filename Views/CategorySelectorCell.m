//
//  CategorySelectorCell.m
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "CategorySelectorCell.h"

@implementation CategorySelectorCell

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

-(void)setCategoryModel:(CategoryModel*)_categoryModel{
    categoryModel = _categoryModel;
    name.text = categoryModel.name;
    
    NSString *imageName = [NSString isStringEmpty:categoryModel.imageName] ? @"sample_food" : categoryModel.imageName;
    imageCategory.image = [UIImage imageNamed:imageName];
}

@end
