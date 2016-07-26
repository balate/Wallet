//
//  JCONotificationCenterTest.m
//  Wallet
//
//  Created by Javier Contreras on 26/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCOFakeNotificationCenter.h"
#import "JCOWallet.h"


@interface JCONotificationCenterTest : XCTestCase

@end

@implementation JCONotificationCenterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) testThatSubcribesToMemoryWarning{

   
    
    JCOFakeNotificationCenter *fake = [JCOFakeNotificationCenter new ];
    
    JCOWallet *w = [JCOWallet new];
    
    [w subscribeToMemoryWarning:(NSNotificationCenter *)fake];
    
    NSDictionary *obs = [fake observers];
    
    id observer = [ obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer , w, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotificafion");
    
}




@end
