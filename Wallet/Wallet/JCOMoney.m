//
//  JCOMoney.m
//  Wallet
//
//  Created by Javier Contreras on 21/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "JCOBroker.h"




@interface JCOMoney ()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation JCOMoney

+(id) euroWithAmount:(NSInteger) amount{
    
    return [[JCOMoney alloc] initWithAmount:amount currency:@"EUR"];

}

+(id) dollarWithAmount:(NSInteger) amount{
    
    return [[JCOMoney alloc] initWithAmount:amount currency:@"USD"];

}

- (id)initWithAmount:(NSInteger) amount currency:(NSString *)currency{

    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
       
    }
    
    return self;
}

-(id<JCOMoney>)times:(NSInteger) multiplier{
    
 
        
        JCOMoney *newMoney = [[JCOMoney alloc]initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
        
        return newMoney;
    
}

-(id<JCOMoney>) plus:(JCOMoney *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    JCOMoney *total = [[JCOMoney alloc] initWithAmount:totalAmount currency:self.currency];
    
    
    return total;
}

-(id<JCOMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(JCOBroker*) broker{
    
    JCOMoney *result;
    
    double rate = [[broker.rates
                    objectForKey:[broker keyForCurrency:self.currency
                                             toCurrency:currency]]doubleValue];
    
    //comprobamos que divisa origen y destino son las mismas
    if ([self.currency isEqual: currency]){
        
        result = self;
        
    }else if (rate == 0 ){
        // No hay tasa de conversion, salta exception!!
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", self.currency, currency];
        
        
    }else {
        
        
        NSInteger  newAmount = [self.amount integerValue] *rate;
        
        result = [[JCOMoney alloc]
                  initWithAmount:newAmount
                  currency:currency];
    
}
    return result;
    
}


#pragma mark - Overwritten
-(NSString *) description{

    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class],self.currency, self.amount];
}


-(NSUInteger) hash{
    
    return [self.amount integerValue];
}


-(BOOL) isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]){
    
        return [self amount] == [object amount];
    }
    else
    
        return NO;
}




@end

