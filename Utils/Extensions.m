//
//  Extensions.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "Extensions.h"

@implementation UIViewController (renanvs)

-(void)pushInNavigationControllerThisControllerName:(NSString*)name{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:name];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UIViewController*)loadStoryBoardViewControllerWithName:(NSString*)name{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:name];
    return vc;
}

-(void)pushInNavigationControllerThisController:(UIViewController *)controller{
    [self.navigationController pushViewController:controller animated:YES];
}

@end
