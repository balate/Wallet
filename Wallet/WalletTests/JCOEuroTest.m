//
//  JCOEuroTest.m
//  Wallet
//
//  Created by Javier Contreras on 15/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//



#import <XCTest/XCTest.h>
#import "JCOEuro.h"
#import "JCOMoney.h"

@interface JCOEuroTest : XCTestCase

@end

@implementation JCOEuroTest

-(void)testMultiplication{

 
    JCOEuro *euro = [JCOMoney euroWithAmount:5];
    JCOEuro *ten = [JCOMoney euroWithAmount:10];
    JCOEuro *total = [euro times:2];
    
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2  shoud be €10");
}

-(void) testEquality {

    JCOEuro *five = [JCOMoney euroWithAmount:5];
    JCOEuro *ten = [JCOMoney euroWithAmount:10];
    JCOEuro *total = [five times:2];
    
    
    XCTAssertEqualObjects(ten, total, @"Equivalent object should be equal");
    
}



-(void) testHash {

    JCOEuro *a = [JCOMoney euroWithAmount:2];
    JCOEuro *b = [JCOMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    
    
}

-(void) testAmountStorage{

    JCOEuro *euro = [JCOMoney euroWithAmount:2];
    
   
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector: @selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
    
#pragma clang diagnostic pop
}





@end
