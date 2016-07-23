//
//  JCODollar.h
//  Wallet
//
//  Created by Javier Contreras on 20/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCOMoney.h"

@interface JCODollar : JCOMoney

-(JCODollar*) times:(NSInteger) multiplier;

@end


