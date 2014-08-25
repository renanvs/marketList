//
//  ListManager.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListManager : NSObject{
//    NSManagedObjectContext *ctx;
    ListItensModel *currentList;
}

+(id)sharedInstance;

@property (nonatomic) ListItensModel *currentList;

+(ListItensModel*)createListWithTitle:(NSString*)title;
+(void)save;
-(NSArray*)validateIfItensIsApproved;
@end
