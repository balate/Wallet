//
//  JCOMoney.h
//  Wallet
//
//  Created by Javier Contreras on 21/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCOMoney : NSObject

- (id) initWithAmount:(NSInteger) amount;

-(JCOMoney *) times:(NSInteger) multiplier;

@end
