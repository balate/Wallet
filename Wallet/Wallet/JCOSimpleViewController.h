//
//  JCOSimpleViewController.h
//  Wallet
//
//  Created by Javier Contreras on 25/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCOSimpleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)displayText:(id)sender;

@end
