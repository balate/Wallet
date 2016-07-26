//
//  JCOWallet.m
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

 @import UIKit;
#import "JCOWallet.h"

@interface JCOWallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation JCOWallet

-(NSUInteger) count{

    return [self.moneys count];
}

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{

    if (self = [super init]) {
        JCOMoney *money = [[JCOMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(id<JCOMoney>) plus:(JCOMoney *)money{

    [self.moneys addObject:money];
    return self;
}

-(id<JCOMoney>) times:(NSInteger) multiplier{

    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for(JCOMoney *each in self.moneys){
    
        JCOMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(JCOMoney*) reduceToCurrency:(NSString *)currrency
                      withBroker:(JCOBroker *)broker{
    
    JCOMoney *result = [[JCOMoney alloc]initWithAmount:0 currency:currrency];
    
    for (JCOMoney *each in self.moneys ) {
        result = [result plus: [each reduceToCurrency:currrency withBroker:broker]];
    }

    return result;

    
}

#pragma mark - Notifications
-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc{


    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}
-(void) dumpToDisk:(NSNotification *) notification{

    //guarda las cosas de disco
}

@end
