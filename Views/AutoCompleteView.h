//
//  AutoCompleteView.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AutoCompleteViewDelegate <NSObject>

@required
-(void)didSelectRow:(NSManagedObject*)mObject;

@end

@interface AutoCompleteView : UIView<UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *autoCompleteTableView;
    NSArray *list;
    id delegate;
}

@property (strong, nonatomic) id delegate;


-(void)populateProductNameWithDesireWord:(NSString*)desireword;
-(void)populateBrandNameWithDesireWord:(NSString*)desireword;

@end
