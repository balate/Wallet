//
//  JCOBroker.h
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JCOMoney;


@interface JCOBroker : NSObject

-(JCOMoney *) reduce:(JCOMoney*) money toCurrency:(NSString *) currency;

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*) fromCurrency
     toCurrency:(NSString*) toCurrency;

@end
