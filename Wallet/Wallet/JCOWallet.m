//
//  JCOWallet.m
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOWallet.h"

@interface JCOWallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation JCOWallet

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

@end
