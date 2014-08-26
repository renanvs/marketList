//
//  SpentItemModel.h
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ItemModel, ListItensModel;

@interface SpentItemModel : NSManagedObject

@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSNumber * valueUnity;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * valueKg;
@property (nonatomic, retain) NSNumber * quantityGrams;
@property (nonatomic, retain) ItemModel *item;
@property (nonatomic, retain) ListItensModel *listItens;

@end
