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
@property(nonatomic, strong) NSMutableDictionary *rates;
@end

@implementation JCOBroker

-(id) init {

    if (self = [super init]) {

        _rates = [@{}mutableCopy];
    }
    return self;
}

-(JCOMoney *) reduce:(JCOMoney*)
    money toCurrency:(NSString *) currency{
    
    return money;
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*) fromCurrency
     toCurrency:(NSString*) toCurrency{
    
    [self.rates setObject:@(rate) forKey:[self keyForCurrency: fromCurrency toCurrency: toCurrency]];

}


#pragma mark -utils
-(NSString *) keyForCurrency: (NSString *) fromCurrency
                  toCurrency:(NSString *) toCurrency{

    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}



@end
