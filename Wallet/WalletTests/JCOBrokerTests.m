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

@property (nonatomic, strong) JCOBroker *emptyBroker;
@property (nonatomic, strong) JCOMoney *oneDollar;

@end

@implementation JCOBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [JCOBroker new];
    self.oneDollar = [JCOMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
    
}


-(void) testSimpleReduction{

    
    JCOMoney *sum = [[JCOMoney dollarWithAmount:5]plus:[JCOMoney dollarWithAmount:5]];
    
    JCOMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NO");
}

//$10 == €5 2:1
-(void) testReduction{
    
    
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    JCOMoney *dollars = [JCOMoney dollarWithAmount:10];
    JCOMoney *euros = [JCOMoney euroWithAmount:5];
    
    JCOMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
  
    
    XCTAssertEqualObjects(converted, euros, @"$10 == 5€ 2:1");

}


-(void) testThatNoRateRaisesException{

    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar
                                  toCurrency:@"EUR"], @"No rates should cuse exception");
    
}


-(void) testThatNilConversionDoesNotChangeMoney{

    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar
                                                        toCurrency:@"USD"],
                          @"A nil conversion should have no effect");
}

@end
