//
//  JCOSimpleViewController.m
//  Wallet
//
//  Created by Javier Contreras on 25/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOSimpleViewController.h"

@interface JCOSimpleViewController ()

@end

@implementation JCOSimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)displayText:(id)sender {
    
    UIButton * btn = sender;
    
    self.displayLabel.text = btn.titleLabel.text;
}
@end
