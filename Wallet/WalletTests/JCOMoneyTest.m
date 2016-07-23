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


-(void) testThatTimesRasisesException{

  //  JCOMoney *money = [[JCOMoney alloc] initWhitAmount :1];
    JCOMoney *money = [[JCOMoney alloc]initWithAmount:1];
    
    XCTAssertThrows([money times:2], @"Should raise an exception");
    
}

@end
