//
//  DevCustomSettings.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DevCustomSettings : NSObject{
    BOOL useFakeSpentItens;
    BOOL useFakeCategories;
    NSArray *fakeSpentItens;
    NSArray *fakeCategories;
}

@property (nonatomic) BOOL useFakeSpentItens;
@property (nonatomic) BOOL useFakeCategories;
@property (nonatomic, strong) NSArray *fakeSpentItens;
@property (nonatomic, strong) NSArray *fakeCategories;

+(id)sharedInstance;

-(void)startDev;

@end
