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
        
    }
    
    return self;
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
        if (spentItem.quantity <= 0 || spentItem.valueUnity == 0 || spentItem.item.category == nil) {
            [_list addObject:spentItem];
        }
    }
    
    return _list;
}

@end
