//
//  JCOControllersTests.m
//  Wallet
//
//  Created by Javier Contreras on 25/7/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCOSimpleViewController.h"

@interface JCOControllersTests : XCTestCase
@property (nonatomic, strong) JCOSimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@end

@implementation JCOControllersTests

- (void)setUp {
    [super setUp];
    //creamos el entorno de laboratorio
    self.simpleVC = [[JCOSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    

}

- (void)tearDown {
    
    [super tearDown];
    self.simpleVC = nil;
    self.button =nil;
    self.label = nil;
}

-(void) testThatsTextOnLabelIsEqualToTextOnButton{

    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    // comprobamos que etiqueta y boton tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and should have the same text");
    
}

@end
