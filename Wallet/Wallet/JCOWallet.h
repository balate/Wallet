//
//  JCOWallet.h
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCOMoney.h"

@interface JCOWallet : NSObject<JCOMoney>
@property (nonatomic, readonly) NSUInteger countCurrency;

-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;

-(NSMutableArray *) currencyArray;

-(NSUInteger) countMoneys : (NSString *) currency;

-(NSMutableArray *) MoneyArray : (NSString*) currency;

-(void) add:(JCOMoney *) money;

-(void) take:(JCOMoney *) money;

@end
