//
//  ItemModel.h
//  marketList
//
//  Created by renanvs on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BrandModel, CategoryModel;

@interface ItemModel : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) BrandModel *brand;
@property (nonatomic, retain) CategoryModel *category;

@end
