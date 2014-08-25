//
//  DevCustomSettings.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "DevCustomSettings.h"

@implementation DevCustomSettings
@synthesize useFakeSpentItens, fakeList;

SynthensizeSingleTon(DevCustomSettings)

-(id)init{
    self = [super init];
    
    if (self) {
    }
    
    return self;
}


-(void)startDev{
    if (useFakeSpentItens) {
        [self createFakeSpentItensMethod];
    }
}

-(void)createFakeSpentItensMethod{
    NSManagedObjectContext *ctx = [NSManagedObjectContext MR_contextForCurrentThread];
    
    BrandModel *brand = [BrandModel MR_createInContext:ctx];
    brand.name = @"Parmalat";
    CategoryModel *category = [CategoryModel MR_createInContext:ctx];
    category.name = @"Alimentos";
    
    ItemModel *item1 = [ItemModel MR_createInContext:ctx];
    item1.name = @"Bolacha";
    item1.brand = brand;
    item1.category = category;
    
    SpentItemModel *spent1 = [SpentItemModel MR_createInContext:ctx];
    spent1.item = item1;
    spent1.quantity = @3;
    spent1.valueUnity = @1.20;
    
    ItemModel *item2 = [ItemModel MR_createInContext:ctx];
    item2.name = @"Leite";
    item2.brand = brand;
    item2.category = category;
    
    SpentItemModel *spent2 = [SpentItemModel MR_createInContext:ctx];
    spent2.item = item2;
    spent2.quantity = @12;
    spent2.valueUnity = @2.70;
    
    ItemModel *item3 = [ItemModel MR_createInContext:ctx];
    item3.name = @"Creme Leite";
    item3.brand = brand;
    item3.category = category;
    
    SpentItemModel *spent3 = [SpentItemModel MR_createInContext:ctx];
    spent3.item = item3;
    spent3.quantity = @1;
    spent3.valueUnity = @0.50;
    
    fakeList = [[NSArray alloc] initWithObjects:spent1, spent2, spent3, nil];
}

@end
