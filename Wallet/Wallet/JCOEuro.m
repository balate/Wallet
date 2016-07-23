//
//  JCOEuro.m
//  Wallet
//
//  Created by Javier Contreras on 15/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOEuro.h"
#import "JCOMoney-Private.h"

@implementation JCOEuro


-(JCOEuro*) times:(NSInteger) multiplier{

    JCOEuro *newEuro = [[JCOEuro alloc]initWithAmount:[self.amount integerValue] * multiplier];
    
    return newEuro;
}


@end

