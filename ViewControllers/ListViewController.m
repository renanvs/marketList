//
//  ListViewController.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "ListViewController.h"
#import "ListItemCell.h"

@interface ListViewController ()

@end

@implementation ListViewController

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
    [[self navigationController] setNavigationBarHidden:YES];
    cellHeight = 0;
    currentList = [[ListManager sharedInstance] currentList];

    if ([[DevCustomSettings sharedInstance] useFakeSpentItens]) {
        NSArray *tempList = [[DevCustomSettings sharedInstance] fakeSpentItens];
        [currentList addSpentItens:[NSSet setWithArray:tempList]];
    }
    
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

- (IBAction)back:(id)sender {
    if ([currentList.isBuying boolValue]) {
        [[[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Voce está comprando, para concluir essa lista voce deve apertar compra finalizada ou desativar o compartamento comprando" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }else{
        [ListManager save];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)buyingAction:(id)sender {
    if (![currentList.isBuying boolValue]) {
        [buyingButton setBackgroundColor:[UIColor greenColor]];
        currentList.isBuying = [NSNumber numberWithInt:1];
    }else{
        [buyingButton setBackgroundColor:[UIColor clearColor]];
        currentList.isBuying = [NSNumber numberWithInt:0];
    }
}

- (IBAction)IncludeItem:(id)sender {
//    IncludeItemViewController *ivc =  (IncludeItemViewController*)[self loadStoryBoardViewControllerWithName:@"IncludeItemViewController"];
//    ivc.currentList = currentList;
//    [self pushInNavigationControllerThisController:ivc];
}

- (IBAction)saveAction:(id)sender {
    NSArray *_listSpentItens = [[ListManager sharedInstance] validateIfItensIsApproved];
    if (_listSpentItens.count > 0) {
        //[self pushInNavigationControllerThisControllerName:<#(NSString *)#>]
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return spentList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SpentItemModel *spentItem = [spentList objectAtIndex:indexPath.row];
    
    NSString *cellIdentifier = [spentItem.type isEqualToString:SpentTypeUnique] ? CellItemUnityList : CellItemWeightList;
    
    ListItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [Utils loadNibForName:cellIdentifier];
    }
    
    [cell setSpentItem:spentItem];
    
    return cell;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
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

-(void)viewWillAppear:(BOOL)animated{
    listName.text = currentList.name;
    spentList = [[NSArray alloc] initWithArray:[currentList.spentItens allObjects]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"SBIitem"]) {
        IncludeItemViewController *ivc = segue.destinationViewController;
        ivc.currentList = currentList;
    }
}

@end
