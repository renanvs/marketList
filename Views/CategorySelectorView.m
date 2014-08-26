//
//  CategorySelectorView.m
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "CategorySelectorView.h"
#import "CategorySelectorCell.h"

@implementation CategorySelectorView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CategorySelectorCell";
    CategorySelectorCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    CategoryModel *category = [listCategories objectAtIndex:indexPath.row];
    
    if (!cell) {
        cell = [Utils loadNibForName:cellIdentifier];
    }
    
    [cell setCategoryModel:category];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryModel *categoryModel = [listCategories objectAtIndex:indexPath.row];
    
    if ([delegate respondsToSelector:@selector(CategorySelectorViewDidSelectCategory:)]) {
        [delegate CategorySelectorViewDidSelectCategory:categoryModel];
    }
    
    [self close:nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listCategories.count;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
    }
    
    return self;
}

-(IBAction)close:(id)sender{
    if ([delegate respondsToSelector:@selector(CategorySelectorViewClose)]) {
        [delegate CategorySelectorViewClose];
    }
}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    listCategories = [[NSArray alloc] initWithArray:[[ListManager sharedInstance] getAllCategories]];
    CGRect tableRect = self.table.frame;
    CGRect buttonFrame = self.closeButton.frame;
    //buttonFrame.origin.x = tableRect.origin.x + tableRect.size.width + (buttonFrame.size.width/2);
    buttonFrame.origin.y = tableRect.origin.y - (buttonFrame.size.height/2);
    self.closeButton.frame = buttonFrame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
