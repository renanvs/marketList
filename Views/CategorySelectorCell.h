//
//  CategorySelectorCell.h
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategorySelectorCell : UITableViewCell{
    
    __weak IBOutlet UIImageView *imageCategory;
    __weak IBOutlet UILabel *name;
    CategoryModel *categoryModel;
}

-(void)setCategoryModel:(CategoryModel*)_categoryModel;

@end
