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
    BOOL useFakeLists;
    NSArray *fakeSpentItens;
    NSArray *fakeCategories;
    NSArray *fakeLists;
}

@property (nonatomic) BOOL useFakeSpentItens;
@property (nonatomic) BOOL useFakeCategories;
@property (nonatomic) BOOL useFakeLists;
@property (nonatomic, strong) NSArray *fakeSpentItens;
@property (nonatomic, strong) NSArray *fakeCategories;
@property (nonatomic, strong) NSArray *fakeLists;

+(id)sharedInstance;

-(void)startDev;

@end
