//
//  JCOBroker.h
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCOMoney.h"


@interface JCOBroker : NSObject

@property(nonatomic, strong) NSMutableDictionary *rates;

-(JCOMoney*) reduce:(id<JCOMoney>) money toCurrency:(NSString *) currency;

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*) fromCurrency
     toCurrency:(NSString*) toCurrency;


-(NSString *) keyForCurrency: (NSString *) fromCurrency
                  toCurrency:(NSString *) toCurrency;


-(void)parseJSONRates:(NSData *) json;


@end
