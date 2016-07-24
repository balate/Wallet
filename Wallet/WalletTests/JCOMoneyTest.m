//
//  JCOMoneyTest.m
//  Wallet
//
//  Created by Javier Contreras on 21/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCOMoney.h"

@interface JCOMoneyTest :  XCTestCase

@end

@implementation JCOMoneyTest


-(void) testCurrencies {


    XCTAssertEqualObjects(@"EUR", [[JCOMoney euroWithAmount:1] currency], @"The currency of euros should be EUR");
  
    XCTAssertEqualObjects(@"USD", [[JCOMoney dollarWithAmount:1] currency], @"The currency of $1 should be USD");
    
    
}




@end
