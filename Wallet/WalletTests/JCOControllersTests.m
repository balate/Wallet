//
//  JCOControllersTests.m
//  Wallet
//
//  Created by Javier Contreras on 25/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCOSimpleViewController.h"
#import "JCOWalletTableViewController.h"
#import "JCOWallet.h"
#import "JCOBroker.h"

@interface JCOControllersTests : XCTestCase
@property (nonatomic, strong) JCOSimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) JCOWalletTableViewController *walletVC;
@property (nonatomic,strong) JCOWallet *wallet;
@property (nonatomic, strong) JCOBroker *broker;


@end

@implementation JCOControllersTests

- (void)setUp {
    [super setUp];
    //creamos el entorno de laboratorio
    self.simpleVC = [[JCOSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[JCOWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[JCOMoney euroWithAmount:1]];
    
    self.broker = [[JCOBroker alloc]init];
    
  
    self.walletVC = [[JCOWalletTableViewController alloc] initWithModel:self.wallet broker:self.broker];

}

- (void)tearDown {
    
    [super tearDown];
    self.simpleVC = nil;
    self.button =nil;
    self.label = nil;
}

-(void) testThatsTextOnLabelIsEqualToTextOnButton{

    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    // comprobamos que etiqueta y boton tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and should have the same text");
    
}

-(void) testThatTablehasOneSection{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView: self.walletVC.tableView];
    
    XCTAssertEqual(sections, 3, @"There can only be one!");

}



-(void) testThatNumberOfCellsIsNumberOfMoneyPlusOne{

    XCTAssertEqual([self.wallet countMoneys:@"USD"] + 1, [self.walletVC tableView: self.walletVC.tableView numberOfRowsInSection:0], @"Number of cell is number  of moneys + 1 ");
}




@end
