//
//  JCOMoney.m
//  Wallet
//
//  Created by Javier Contreras on 21/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "JCOMoney-Private.h"



@implementation JCOMoney

- (id)initWithAmount:(NSInteger) amount{

    if (self = [super init]) {
        _amount = @(amount);
         //_amount = amount;
    }
    
    return self;
}

-(JCOMoney *)times:(NSInteger) multiplier{
    
    //no se deberia de llamar, sino que se debería de usar la subclase
    return [self subclassResponsibility:_cmd];
}


#pragma mark - Overwritten
-(NSString *) description{

    return [NSString stringWithFormat:@"@<%@ %ld>",
            [self class], (long)[self amount]];
}


-(NSUInteger) hash{
    
    return (NSUInteger) self.amount;
}



-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}

@end

