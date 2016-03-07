//
//  ViewController.m
//  STPackage
//
//  Created by yeah on 2/22/16.
//  Copyright © 2016 yeah. All rights reserved.
//

#import "ViewController.h"
#import "STPackageViewController.h"
@interface ViewController ()
- (IBAction)btn:(id)sender;
@property STPackageViewController*pckController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn:(id)sender {
    self.pckController=[[STPackageViewController alloc] initWithNibName:@"STPackageViewController" bundle:nil];
    [self addChildViewController:self.pckController];
    [self.view addSubview:self.pckController.view];
    self.pckController.view.frame = self.view.bounds;
    NSLog(@"sdsd");
}
@end
