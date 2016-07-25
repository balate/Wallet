//
//  JCOBroker.m
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOBroker.h"
#import "JCOMoney.h"


@interface JCOBroker()

@end

@implementation JCOBroker

-(id) init {

    if (self = [super init]) {

        _rates = [@{}mutableCopy];
    }
    return self;
}

-(id<JCOMoney>) reduce:(id<JCOMoney>)money
          toCurrency:(NSString *) currency{
   
   //double dispatch
    return [money reduceToCurrency:currency withBroker:self];

    
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*) fromCurrency
     toCurrency:(NSString*) toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyForCurrency: fromCurrency
                                    toCurrency: toCurrency]];
    
    [self.rates setObject:@(1.0/rate)
                   forKey:[self keyForCurrency: toCurrency
                                    toCurrency: fromCurrency]];

}


#pragma mark -utils
-(NSString *) keyForCurrency: (NSString *) fromCurrency
                  toCurrency:(NSString *) toCurrency{

    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}



@end
