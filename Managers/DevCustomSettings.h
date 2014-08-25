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
    NSArray *fakeList;
}

@property (nonatomic) BOOL useFakeSpentItens;
@property (nonatomic, strong) NSArray *fakeList;

+(id)sharedInstance;

-(void)startDev;

@end
