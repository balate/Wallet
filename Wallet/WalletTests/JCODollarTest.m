//
//  JCODollarTest.m
//  Wallet
//
//  Created by Javier Contreras on 20/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCODollar.h"
#import "JCOMoney.h"

@interface JCODollarTest : XCTestCase

@end

@implementation JCODollarTest

-(void) testMultiplacation{

    JCODollar *five = [JCOMoney dollarWithAmount:5 ];
    JCODollar *total = [five times: 2];
    JCODollar *ten = [JCOMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(ten, total, @"$5 *2 = 10$");
}

-(void) testEquality{
    
    JCODollar *five =[JCOMoney dollarWithAmount:5];
    JCODollar *total = [five times: 2];
    JCODollar *ten = [JCOMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(ten, total, @"$5 *2 = 10$");
    XCTAssertFalse([total isEqual:five] , @"Non equivalent objects should not be equal");

}



-(void) testHash {
    
    JCODollar *a = [JCOMoney dollarWithAmount:2];
    JCODollar *b = [JCOMoney dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    
    
}

-(void) testAmountStorage{
    
   JCODollar *dollar = [JCOMoney dollarWithAmount:2];

    
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dollar performSelector: @selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}


@end
