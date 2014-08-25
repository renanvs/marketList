//
//  MarketModel.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ListItensModel;

@interface MarketModel : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *listsItens;
@end

@interface MarketModel (CoreDataGeneratedAccessors)

- (void)addListsItensObject:(ListItensModel *)value;
- (void)removeListsItensObject:(ListItensModel *)value;
- (void)addListsItens:(NSSet *)values;
- (void)removeListsItens:(NSSet *)values;

@end
