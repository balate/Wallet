//
//  JCOWalletTableViewController.h
//  Wallet
//
//  Created by Javier Contreras on 25/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCOBroker.h"
@class JCOWallet;

@interface JCOWalletTableViewController : UITableViewController
/*
-(id) initWhitModel:(JCOWallet *) model;
*/
-(id) initWithModel: (JCOWallet *) wallet
             broker: (JCOBroker *) broker;



@end
