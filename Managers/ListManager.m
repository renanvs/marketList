//
//  ListManager.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "ListManager.h"

@implementation ListManager
@synthesize currentList;

SynthensizeSingleTon(ListManager)

-(id)init{
    self = [super init];
    
    if (self) {
        
        CategoryModel *defaultCategory = [self getDefaultCategory];
        if (!defaultCategory) {
            defaultCategory = [CategoryModel MR_createInContext:[NSManagedObjectContext MR_contextForCurrentThread]];
        }
        
    }
    
    return self;
}

-(CategoryModel*)getDefaultCategory{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == 'Outros'"];
    return [[CategoryModel MR_findAllWithPredicate:predicate] lastObject];
}

+(ListItensModel*)createListWithTitle:(NSString*)title{
    ListItensModel *list = [ListItensModel MR_createInContext:[self ctx]];
    list.name = title;
    list.date = [NSDate date];
    return list;
}


+(NSManagedObjectContext*)ctx{
    return [NSManagedObjectContext MR_contextForCurrentThread];
}

+(void)save{
    [[self ctx] MR_saveToPersistentStoreWithCompletion:nil];
}

-(NSArray*)validateIfItensIsApproved{
    NSMutableArray *_list = [[NSMutableArray alloc] init];
    for (SpentItemModel *spentItem in currentList.spentItens) {
        if ([spentItem.quantity intValue] == 0 || [spentItem.valueUnity floatValue] == 0 || spentItem.item.category == nil) {
            [_list addObject:spentItem];
        }
    }
    
    return _list;
}

-(NSArray *)getAllCategories{
    NSArray *_list = nil;
    
    if ([[DevCustomSettings sharedInstance] useFakeCategories]) {
        _list = [[DevCustomSettings sharedInstance] fakeCategories];
    }else{
        _list = [CategoryModel MR_findAll];
    }
    
    return _list;
}

-(NSArray*)getAllListItensModel{
    NSArray *_list = [ListItensModel MR_findAll];
    return _list;
}

@end
