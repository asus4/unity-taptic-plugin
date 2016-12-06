//
//  ViewController.m
//  unity-taptic-plugin
//
//  Created by Koki Ibukuro on 12/6/16.
//  Copyright © 2016 asus4. All rights reserved.
//

#import "ViewController.h"
#import "UnityTapticPlugin.h"

@interface ViewController ()

@property (nonatomic, retain) UnityTapticPlugin* taptic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.taptic = [UnityTapticPlugin shared];
    
    [UnityTapticPlugin isSupport];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onNotification:(UISegmentedControl *)sender {
    UINotificationFeedbackType type = (UINotificationFeedbackType) sender.selectedSegmentIndex;
    [self.taptic notification:type];
}

- (IBAction)onImpact:(UISegmentedControl *)sender {
    [self.taptic impact:(UIImpactFeedbackStyle)sender.selectedSegmentIndex];
}

- (IBAction)onSelection:(id)sender {
    [self.taptic selection];
}

@end
