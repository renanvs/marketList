//
//  ListViewController.m
//  marketList
//
//  Created by renan veloso silva on 8/24/14.
//  Copyright (c) 2014 renanvs. All rights reserved.
//

#import "ListViewController.h"
#import "ListItemCell.h"
#import "PendingItensViewController.h"

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
    
    [saveButton setHidden:YES];
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
        [[[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Voce está comprando, para concluir essa lista voce deve apertar compra finalizada ou desativar o compartamento comprando" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }else{
        [ListManager save];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)buyingAction:(id)sender {
    if (![currentList.isBuying boolValue]) {
        [buyingButton setBackgroundColor:[UIColor greenColor]];
        currentList.isBuying = [NSNumber numberWithInt:1];
        [saveButton setHidden:NO];
    }else{
        [buyingButton setBackgroundColor:[UIColor clearColor]];
        currentList.isBuying = [NSNumber numberWithInt:0];
        [saveButton setHidden:YES];
    }
}

- (IBAction)IncludeItem:(id)sender {
}

- (IBAction)saveAction:(id)sender {
    pendingist = [[ListManager sharedInstance] validateIfItensIsApproved];
    if (pendingist.count > 0) {
        [[[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Existem campos que devem ser finalizados em alguns itens" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        //[self performSegueWithIdentifier:@"SeguePending" sender:self];
    }else{
        UIAlertView *al = [[UIAlertView alloc] init];
        al.alertViewStyle = UIAlertViewStylePlainTextInput;
        al.delegate = self;
        al.title = @"Estabelecimento";
        al.message = @"Qual o estabelecimento voce esta comprando";
        [al addButtonWithTitle:@"OK"];
        [al addButtonWithTitle:@"Cancelar"];
        
        [al show];
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
    if (buttonIndex == 0) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        [self getOrCreateMarketModelWithTitle:textField.text];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

-(void)getOrCreateMarketModelWithTitle:(NSString*)marketName{
    NSManagedObjectContext *ctx = [NSManagedObjectContext MR_contextForCurrentThread];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",marketName];
    MarketModel *_marketModel = [[MarketModel MR_findAllWithPredicate:predicate] lastObject];
    if (!_marketModel) {
        _marketModel = [MarketModel MR_createInContext:ctx];
        _marketModel.name = marketName;
    }
    
    [_marketModel addListsItensObject:currentList];
    [ListManager save];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedSpentItemModel = [spentList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"SBIitem" sender:self];
    
}

-(void)viewWillAppear:(BOOL)animated{
    listName.text = currentList.name;
    selectedSpentItemModel = nil;
    spentList = [currentList.spentItens allObjects];
    [listItemTableView reloadData];
    NSLog(@"dsfsd");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"SBIitem"]) {
        IncludeItemViewController *ivc = segue.destinationViewController;
        ivc.currentList = currentList;
        ivc.spentItemModel = selectedSpentItemModel;
    }else if([segue.identifier isEqualToString:@"SeguePending"]) {
        PendingItensViewController *ivc = segue.destinationViewController;
        ivc.pendingList = pendingist;
    }
}

@end
