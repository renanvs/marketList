//
//  DevCustomSettings.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "DevCustomSettings.h"

@implementation DevCustomSettings
@synthesize useFakeSpentItens, fakeSpentItens, useFakeCategories, fakeCategories, fakeLists, useFakeLists;

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
    
    if (useFakeCategories) {
        [self createFakeCategories];
    }
    
    if (useFakeLists) {
        [self createFakeLists];
    }
}

-(void)createFakeSpentItensMethod{
    NSArray *catList = [CategoryModel MR_findAll];
    if (catList.count > 0) {
        return;
    }
    
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
    spent1.type = SpentTypeUnique;
    
    ItemModel *item2 = [ItemModel MR_createInContext:ctx];
    item2.name = @"Leite";
    item2.brand = brand;
    item2.category = category;
    
    SpentItemModel *spent2 = [SpentItemModel MR_createInContext:ctx];
    spent2.item = item2;
    spent2.quantity = @12;
    spent2.valueUnity = @2.70;
    spent2.type = SpentTypeUnique;
    
    ItemModel *item3 = [ItemModel MR_createInContext:ctx];
    item3.name = @"Creme Leite";
    item3.brand = brand;
    item3.category = category;
    
    SpentItemModel *spent3 = [SpentItemModel MR_createInContext:ctx];
    spent3.item = item3;
    spent3.quantity = @1;
    spent3.valueUnity = @0.50;
    spent3.type = SpentTypeUnique;
    
    ItemModel *item4 = [ItemModel MR_createInContext:ctx];
    item4.name = @"Presunto";
    item4.brand = brand;
    item4.category = category;
    
    SpentItemModel *spent4 = [SpentItemModel MR_createInContext:ctx];
    spent4.item = item4;
    spent4.quantityGrams = @300;
    spent4.valueKg = @5;
    spent4.type = SpentTypeWeight;
    
    ItemModel *item5 = [ItemModel MR_createInContext:ctx];
    item5.name = @"Queijo";
    item5.brand = brand;
    item5.category = category;
    
    SpentItemModel *spent5 = [SpentItemModel MR_createInContext:ctx];
    spent5.item = item5;
    spent5.quantityGrams = @500;
    spent5.valueKg = @10;
    spent5.type = SpentTypeWeight;
    
    
    fakeSpentItens = [[NSArray alloc] initWithObjects:spent1, spent2, spent3, spent4, spent5, nil];
}


-(void)createFakeCategories{
    NSManagedObjectContext *ctx = [NSManagedObjectContext MR_contextForCurrentThread];
    
    CategoryModel *c0 = [CategoryModel MR_createInContext:ctx];
    c0.name = @"alimento";
    
    CategoryModel *c1 = [CategoryModel MR_createInContext:ctx];
    c1.name = @"fruta";
    
    CategoryModel *c2 = [CategoryModel MR_createInContext:ctx];
    c2.name = @"legume";
    
    CategoryModel *c3 = [CategoryModel MR_createInContext:ctx];
    c3.name = @"limpeza";
    
    CategoryModel *c4 = [CategoryModel MR_createInContext:ctx];
    c4.name = @"banho";
    
    CategoryModel *c5 = [CategoryModel MR_createInContext:ctx];
    c5.name = @"carro";
    
    fakeCategories = [[NSArray alloc] initWithObjects:c0, c1, c2, c3, c4, c5, nil];
}

-(void)createFakeLists{
    NSManagedObjectContext *ctx = [NSManagedObjectContext MR_contextForCurrentThread];
    
    ListItensModel *list0 = [ListItensModel MR_createInContext:ctx];
    list0.date = [NSDate date];
    list0.isBuying = [NSNumber numberWithBool:YES];
    list0.name = @"Comprado";
    NSSet *sets = [NSSet setWithArray:fakeSpentItens];
    [list0 addSpentItens:sets];
    
    MarketModel *marketModel = [MarketModel MR_createInContext:ctx];
    marketModel.name = @"Carrefour";
    [marketModel addListsItensObject:list0];
    
    list0.market = marketModel;
    
}

@end
