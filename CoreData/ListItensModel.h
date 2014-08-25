//
//  ListItensModel.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MarketModel, SpentItemModel;

@interface ListItensModel : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * isBuying;
@property (nonatomic, retain) MarketModel *market;
@property (nonatomic, retain) NSSet *spentItens;
@end

@interface ListItensModel (CoreDataGeneratedAccessors)

- (void)addSpentItensObject:(SpentItemModel *)value;
- (void)removeSpentItensObject:(SpentItemModel *)value;
- (void)addSpentItens:(NSSet *)values;
- (void)removeSpentItens:(NSSet *)values;

@end
