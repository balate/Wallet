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


-(void)testMultiplication{
    
    
    JCOMoney *euro = [JCOMoney euroWithAmount:5];
    JCOMoney *ten = [JCOMoney euroWithAmount:10];
    JCOMoney *total = [euro times:2];
    
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2  shoud be €10");
   
}

-(void) testEquality {
    
    JCOMoney *five = [JCOMoney euroWithAmount:5];
    JCOMoney *ten = [JCOMoney euroWithAmount:10];
    JCOMoney *total = [five times:2];
    
    
    XCTAssertEqualObjects(ten, total, @"Equivalent object should be equal");
    
    // * pruebo tambien los distitos subtipos, por si se escapa algun booleano * . Así que pruebo los USD también
    XCTAssertEqualObjects([JCOMoney dollarWithAmount:4], [[JCOMoney dollarWithAmount:2]times:2], @"Equivalent object should be equal");
    
}


-(void) testDiferentCurrencies{


    JCOMoney *euro = [JCOMoney euroWithAmount:1];
    JCOMoney *dollar = [JCOMoney dollarWithAmount:1];
    
    
    XCTAssertNotEqualObjects(euro, dollar, @"Diferent currencies should not be equeal!");

}

-(void) testHash {
    
    JCOMoney *a = [JCOMoney euroWithAmount:2];
    JCOMoney *b = [JCOMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    // * pruebo tambien los distitos subtipos, por si se escapa algun booleano *
    XCTAssertEqual([[JCOMoney dollarWithAmount:1] hash], [[JCOMoney dollarWithAmount:1]hash], @"Equal objects must have same hash");
    
    
}

-(void) testAmountStorage{
    
    JCOMoney *euro = [JCOMoney euroWithAmount:2];
    
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector: @selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
    
    // * pruebo tambien los distitos subtipos, por si se escapa algun booleano *
    XCTAssertEqual(2,[[[JCOMoney dollarWithAmount:2] performSelector: @selector(amount)]integerValue ], @"The value retrieved should be the same as the stored");
    
#pragma clang diagnostic pop
}


-(void) testSimpleAddinction{
    
    XCTAssertEqualObjects([[JCOMoney dollarWithAmount:5]
                           plus:[JCOMoney dollarWithAmount:5]],
                           [JCOMoney dollarWithAmount:10],
                           @"$5+$5 =10");
    
}


-(void) testThatHashIsAmount{


    JCOMoney *one = [JCOMoney dollarWithAmount:1];
    
    XCTAssertEqual([one hash], 1, @"The hash must be the same as the amount");
    
}

-(void) testDesscription{

    JCOMoney *one = [JCOMoney dollarWithAmount:1];
    NSString *desc = @"<JCOMoney: $1";
    
    XCTAssertEqualObjects(desc, [one description], @"Description match template");
    

}


@end
