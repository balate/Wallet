//
//  JCODollar.m
//  Wallet
//
//  Created by Javier Contreras on 20/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCODollar.h"
#import "JCOMoney-Private.h"
@implementation JCODollar



-(JCODollar*) times:(NSInteger) multiplier{
    
    JCODollar *newDollar = [[JCODollar alloc]initWithAmount:[self.amount integerValue] * multiplier];
    
    return newDollar;
}




@end
