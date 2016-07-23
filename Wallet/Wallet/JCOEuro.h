//
//  JCOEuro.h
//  Wallet
//
//  Created by Javier Contreras on 15/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCOMoney.h"

@interface JCOEuro : JCOMoney

-(JCOEuro*) times:(NSInteger) multiplier;

@end
