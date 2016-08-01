//
//  JCOMoney.h
//  Wallet
//
//  Created by Javier Contreras on 21/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JCOMoney;
@class JCOBroker;

@protocol JCOMoney <NSObject>

- (id) initWithAmount:(NSInteger) amount
             currency:(NSString *) currency;

-(id<JCOMoney>) times:(NSInteger) multiplier;

-(id<JCOMoney>) plus: (JCOMoney *) other;

-(id<JCOMoney>) reduceToCurrency:(NSString*) currrency withBroker:(JCOBroker*) broker;

@end

@interface JCOMoney : NSObject<JCOMoney>

@property (nonatomic, strong,readonly) NSNumber *amount;
@property (nonatomic,readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;


@end
