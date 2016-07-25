//
//  JCOWallet.h
//  Wallet
//
//  Created by Javier Contreras on 24/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCOMoney.h"

@interface JCOWallet : NSObject<JCOMoney>
@property (nonatomic, readonly) NSUInteger count;

@end
