//
//  JCOBrokerTests.m
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCOMoney.h"
#import "JCOBroker.h"

@interface JCOBrokerTests : XCTestCase

@end

@implementation JCOBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) testSimpleReduction{

    JCOBroker *broker = [[JCOBroker alloc] init];
    JCOMoney *sum = [[JCOMoney dollarWithAmount:5]plus:[JCOMoney dollarWithAmount:5]];
    
    JCOMoney *reduced = [broker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NO");
}

@end
