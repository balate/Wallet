//
//  JCOFakeNotificationCenter.h
//  Wallet
//
//  Created by Javier Contreras on 26/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCOFakeNotificationCenter : NSObject

@property(nonatomic,strong) NSMutableDictionary *observers;

-(void) addObserver:(id)observer
           selector:(SEL)aSelector
               name:( NSString *)aName
             object:( id)anObject;

@end
