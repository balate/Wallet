//
//  JCOFakeNotificationCenter.m
//  Wallet
//
//  Created by Javier Contreras on 26/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOFakeNotificationCenter.h"

@implementation JCOFakeNotificationCenter

-(id) init{

    if(self = [super init]){

        _observers = [NSMutableDictionary dictionary];
    }
    
    return self;
}

-(void) addObserver:(id)observer
           selector:(SEL)aSelector
               name:( NSString *)aName
             object:( id)anObject{


    [self.observers setObject:observer forKey:aName];
}


@end
