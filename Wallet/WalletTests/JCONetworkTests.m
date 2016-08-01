//
//  JCONetworkTests.m
//  Wallet
//
//  Created by Javier Contreras on 27/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCOBroker.h"

@interface JCONetworkTests : XCTestCase

@end

@implementation JCONetworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) testThatEmptyRatesRaisesExcetion{

    JCOBroker *broker = [JCOBroker new];
    
    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates: jsonData],@"An empty json should raise exception");
    
    
    
}

@end
