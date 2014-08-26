//
//  CategoryModel.h
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ItemModel;

@interface CategoryModel : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSSet *itens;
@end

@interface CategoryModel (CoreDataGeneratedAccessors)

- (void)addItensObject:(ItemModel *)value;
- (void)removeItensObject:(ItemModel *)value;
- (void)addItens:(NSSet *)values;
- (void)removeItens:(NSSet *)values;

@end
