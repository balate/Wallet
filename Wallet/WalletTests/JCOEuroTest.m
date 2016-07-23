//
//  JCOEuroTest.m
//  Wallet
//
//  Created by Javier Contreras on 15/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//



#import <XCTest/XCTest.h>
#import "JCOEuro.h"

@interface JCOEuroTest : XCTestCase

@end

@implementation JCOEuroTest

-(void)testMultiplication{

 
    JCOEuro *euro = [[JCOEuro alloc] initWithAmount:5];
    JCOEuro *ten = [[JCOEuro alloc] initWithAmount:10];
    JCOEuro *total = [euro times:2];
    
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2  shoud be €10");
}

-(void) testEquality {

    JCOEuro *five = [[JCOEuro alloc] initWithAmount:5];
    JCOEuro *ten = [[JCOEuro alloc] initWithAmount:10];
    JCOEuro *total = [five times:2];
    
    
    XCTAssertEqualObjects(ten, total, @"Equivalent object should be equal");
    
}



-(void) testHash {

    JCOEuro *a = [[JCOEuro alloc]initWithAmount:2];
    JCOEuro *b = [[JCOEuro alloc]initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    
    
}

-(void) testAmountStorage{

    JCOEuro *euro = [[JCOEuro alloc] initWithAmount:2];
    
   
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector: @selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
    
#pragma clang diagnostic pop
}





@end
