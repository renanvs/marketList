//
//  SpentItemModel.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ItemModel, ListItensModel;

@interface SpentItemModel : NSManagedObject

@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSNumber * valueUnity;
@property (nonatomic, retain) ItemModel *item;
@property (nonatomic, retain) ListItensModel *listItens;

@end
