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

-(JCOMoney *) reduce:(JCOMoney*) money
          toCurrency:(NSString *) currency{
   
    JCOMoney *result;
    double rate = [[self.rates objectForKey:[self keyForCurrency:money.currency toCurrency:currency]]doubleValue];
    
    //comprobamos que divisa origen y destino son las mismas
    if ([money.currency isEqual:currency]){
    
        result = money;
    }else if (rate == 0 ){
        // No hay tasa de conversion, salta exception!!
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", money.currency, currency];

    
    }else {
    
        // Tenemos conversión
        double rate = [[self.rates objectForKey:[self keyForCurrency:money.currency
                                                          toCurrency:currency]] doubleValue];
        
        NSInteger  newAmount = [money.amount integerValue] *rate;
        
        result = [[JCOMoney alloc]
                  initWithAmount:newAmount
                        currency:currency];
        
        
    }
    return result;
    

    
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
