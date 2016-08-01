//
//  JCOWalletTests.m
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCOMoney.h"
#import "JCOBroker.h"
#import "JCOWallet.h"

@interface JCOWalletTests : XCTestCase


@end

@implementation JCOWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



//40€+40$ = 100$ 2:1
-(void) testsAddictionWithReduction{
    
    JCOBroker *broker = [JCOBroker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    JCOWallet *wallet = [[JCOWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [JCOMoney dollarWithAmount:20]];
    
    JCOMoney *reduced = [broker reduce:wallet toCurrency:@"USD" ];
    
    XCTAssertEqualObjects(reduced, [JCOMoney dollarWithAmount:100], @"€40+ $40 = $100 2:1");
}

//Tests para contar el numero Money para poder pintar la tabla
-(void) testsCountCurrency{
    
    JCOWallet *wallet = [[JCOWallet alloc] initWithAmount:1 currency:@"EUR"];
    [wallet plus:[JCOMoney dollarWithAmount:10]];
    
    XCTAssertEqual(2, [wallet countCurrency], @"Two different currency tipes (EUR and USD)");
    
    }

@end
