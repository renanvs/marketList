//
//  Extensions.h
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (renanvs)

-(void)pushInNavigationControllerThisControllerName:(NSString*)name;
-(UIViewController*)loadStoryBoardViewControllerWithName:(NSString*)name;
-(void)pushInNavigationControllerThisController:(UIViewController *)controller;

@end
