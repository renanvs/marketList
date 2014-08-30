//
//  ListsViewController.m
//  marketList
//
//  Created by renan veloso silva on 8/26/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "ListsViewController.h"
#import "ListsTableViewCell.h"

@interface ListsViewController ()

@end

@implementation ListsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    spentItemModelLists = [[ListManager sharedInstance] getAllListItensModel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return spentItemModelLists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListItensModel *_model = [spentItemModelLists objectAtIndex:indexPath.row];
    NSString *identifier = _model.isBuying ? @"ListsTableViewCell0" : @"ListsTableViewCell1";
    ListsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[ListsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    [cell setupCellWithListItens:_model];
    
    return cell;
    
}

-(IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListItensModel *listItensModel = [spentItemModelLists objectAtIndex:indexPath.row];
    
    [[ListManager sharedInstance] setCurrentList:listItensModel];
    
    [self pushInNavigationControllerThisControllerName:SBList];
}

@end
