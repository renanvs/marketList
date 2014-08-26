//
//  AutoCompleteView.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "AutoCompleteView.h"

@implementation AutoCompleteView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"simpleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setBackgroundColor:[UIColor greenColor]];
    cell.textLabel.text = [NSString stringWithFormat:@"index: %i",(int)indexPath.row];
    
    return cell;
}

-(id)init{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    CGRect frame = self.frame;
    frame.size.height = 190;
    self.frame = frame;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSManagedObject *mObject = [list objectAtIndex:indexPath.row];
    
    if ([delegate respondsToSelector:@selector(didSelectRow:)]) {
        [delegate didSelectRow:mObject];
    }
}

-(void)populateProductNameWithDesireWord:(NSString*)desireword{
    //todo: find product name with query
    list = [[NSArray alloc] init];
}

-(void)populateBrandNameWithDesireWord:(NSString*)desireword{
    //todo: find brand name with query
    list = [[NSArray alloc] init];
}

@end
