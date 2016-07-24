//
//  JCOMoney.h
//  Wallet
//
//  Created by Javier Contreras on 21/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCOMoney : NSObject

@property (nonatomic,readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

- (id) initWithAmount:(NSInteger) amount
             currency:(NSString *) currency;

-(id) times:(NSInteger) multiplier;

-(JCOMoney *) plus: (JCOMoney *) other;

@end
