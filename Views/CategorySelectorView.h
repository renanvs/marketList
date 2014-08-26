//
//  CategorySelectorView.h
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategorySelectorViewDelegate <NSObject>

@optional
-(void)CategorySelectorViewClose;
-(void)CategorySelectorViewDidSelectCategory:(CategoryModel*)category;

@end

@interface CategorySelectorView : UIView<UITableViewDataSource, UITableViewDelegate>{
    NSArray *listCategories;
    id<CategorySelectorViewDelegate> delegate;
}

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@property (nonatomic) id<CategorySelectorViewDelegate> delegate;

-(IBAction)close:(id)sender;

@end
