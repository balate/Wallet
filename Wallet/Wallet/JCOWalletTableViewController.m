//
//  JCOWalletTableViewController.m
//  Wallet
//
//  Created by Javier Contreras on 25/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOWalletTableViewController.h"
#import "JCOWallet.h"

@interface JCOWalletTableViewController ()
/*
@property (nonatomic,strong) JCOWallet *model;
*/

@property (nonatomic,strong) JCOWallet *wallet;
@property(nonatomic,strong) JCOBroker *broker;

@end

@implementation JCOWalletTableViewController


-(id) initWithModel:(JCOWallet *) wallet
             broker:(JCOBroker *) broker{

    if(self = [super initWithStyle:UITableViewStylePlain]){
    
        _wallet = wallet;
        _broker = broker;
       
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if(section == [self.wallet countCurrency]){
    
        return @"Total";
    }
    
    
    return [self.wallet.currencyArray objectAtIndex:section];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.wallet countCurrency] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    if(section == [self.wallet countCurrency]){
        
        return 1;
    }
    
    
    return [self.wallet countMoneys:[[self.wallet currencyArray]objectAtIndex:section]]+1 ;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
  // JCOMoney *money = [[self.wallet MoneyArray:[[self.wallet currencyArray]objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"reuseIdentifier" ];
    }
    
    
    JCOMoney * euMoney;
    JCOMoney * dlMoney;
    NSString *total = @"Total";
    
    if(indexPath.section == [self.wallet countCurrency]){
    
        euMoney = [self.wallet reduceToCurrency:@"EUR" withBroker:self.broker];
        dlMoney = [self.wallet reduceToCurrency:@"USD" withBroker:self.broker];
        total = [NSString stringWithFormat:@"Total %d", euMoney.amount.intValue+dlMoney.amount.intValue];
        
      
     
        cell.textLabel.text = total;
        cell.detailTextLabel.text = @"EUR";
    
    }else{
    
        if(indexPath.row == [self.wallet countMoneys:[[self.wallet currencyArray]objectAtIndex:indexPath.section]]){
            
            NSArray *currencyArray = [self.wallet currencyArray];
            NSString *currency = [currencyArray objectAtIndex:indexPath.section];
        
            euMoney = [self.wallet reduceToCurrency: currency withBroker:self.broker];
            
            total = [NSString stringWithFormat:@"Total %d", euMoney.amount.intValue];
           
            cell.textLabel.text = total;
            cell.detailTextLabel.text = currency;

        }else{
        
            JCOMoney *money = [[self.wallet MoneyArray:[[self.wallet currencyArray]objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        
            cell.textLabel.text = money.amount.description;
            cell.detailTextLabel.text = money.currency;
        }
        
    }
    
    

    
    return cell;



}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
