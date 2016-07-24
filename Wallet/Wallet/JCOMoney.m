//
//  JCOMoney.m
//  Wallet
//
//  Created by Javier Contreras on 21/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOMoney.h"
#import "NSObject+GNUStepAddons.h"




@interface JCOMoney ()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation JCOMoney

+(id) euroWithAmount:(NSInteger) amount{
    
    return [[JCOMoney alloc] initWithAmount:amount currency:@"EUR"];

}

+(id) dollarWithAmount:(NSInteger) amount{
    
    return [[JCOMoney alloc] initWithAmount:amount currency:@"USD"];

}

- (id)initWithAmount:(NSInteger) amount currency:(NSString *)currency{

    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
         //_amount = amount;
    }
    
    return self;
}

-(id)times:(NSInteger) multiplier{
    
 
        
        JCOMoney *newMoney = [[JCOMoney alloc]initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
        
        return newMoney;
    
    
    

    
}


#pragma mark - Overwritten
-(NSString *) description{

    return [NSString stringWithFormat:@"@<%@ %ld>",
            [self class], (long)[self amount]];
}


-(NSUInteger) hash{
    
    return (NSUInteger) self.amount;
}


-(BOOL) isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]){
    
        return [self amount] == [object amount];
    }
    else
    
        return NO;
}

@end

