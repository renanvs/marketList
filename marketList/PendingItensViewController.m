//
//  PendingItensViewController.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "PendingItensViewController.h"
#import "ListItemCell.h"

@interface PendingItensViewController ()

@end

@implementation PendingItensViewController
@synthesize pendingList;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)leftButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)rigthButtonAction:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Funcionalidade ainda em desenvolvimento" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return pendingList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SpentItemModel *spentItem = [pendingList objectAtIndex:indexPath.row];
    
    NSString *cellIdentifier = [spentItem.type isEqualToString:SpentTypeUnique] ? CellItemUnityList : CellItemWeightList;
    
    ListItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [Utils loadNibForName:cellIdentifier];
    }
    
    [cell setSpentItem:spentItem];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (cellHeight > 0) {
        return cellHeight;
    }
    
    ListItemCell *cell = [Utils loadNibForName:CellItemUnityList];
    CGRect frame = cell.frame;
    cellHeight = frame.size.height;
    return cellHeight;
}

@end
