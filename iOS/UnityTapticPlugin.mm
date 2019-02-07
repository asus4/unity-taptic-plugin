//
//  UnityTapticPlugin.m
//  unity-taptic-plugin
//
//  Created by Koki Ibukuro on 12/6/16.
//  Copyright © 2016 asus4. All rights reserved.
//

#import "UnityTapticPlugin.h"

#pragma mark - UnityTapticPlugin

@interface UnityTapticPlugin ()
@property (nonatomic, strong) UINotificationFeedbackGenerator* notificationGenerator;
@property (nonatomic, strong) UISelectionFeedbackGenerator* selectionGenerator;
@property (nonatomic, strong) NSArray<UIImpactFeedbackGenerator*>* impactGenerators;
@end

@implementation UnityTapticPlugin

static UnityTapticPlugin * _shared;

+ (UnityTapticPlugin*) shared {
    @synchronized(self) {
        if(_shared == nil) {
            _shared = [[self alloc] init];
        }
    }
    return _shared;
}

- (id) init {
    if (self = [super init])
    {
        self.notificationGenerator = [UINotificationFeedbackGenerator new];
        [self.notificationGenerator prepare];
        
        self.selectionGenerator = [UISelectionFeedbackGenerator new];
        [self.selectionGenerator prepare];
        
        self.impactGenerators = @[
             [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight],
             [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium],
             [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy],
        ];
        for(UIImpactFeedbackGenerator* impact in self.impactGenerators) {
            [impact prepare];
        }
    }
    return self;
}

- (void) dealloc {
    self.notificationGenerator = NULL;
    self.selectionGenerator = NULL;
    self.impactGenerators = NULL;
}

- (void) notification:(UINotificationFeedbackType)type {
    [self.notificationGenerator notificationOccurred:type];
}


- (void) selection {
    [self.selectionGenerator selectionChanged];
}

- (void) impact:(UIImpactFeedbackStyle)style {
    [self.impactGenerators[(int) style] impactOccurred];
}

+ (BOOL) isSupport {
    // http://stackoverflow.com/questions/39564510/check-if-device-supports-uifeedbackgenerator-in-ios-10
    
    // Private API
    // NSNumber* support = [[UIDevice currentDevice] valueForKey:@"_feedbackSupportLevel"];
    // return support.intValue == 2;

    if ([UINotificationFeedbackGenerator class]) {
        return YES;
    }
    return NO;
    
}

@end

#pragma mark - Unity Bridge

extern "C" {
    void _unityTapticNotification(int type) {
        [[UnityTapticPlugin shared] notification:(UINotificationFeedbackType) type];
    }
    
    void _unityTapticSelection() {
        [[UnityTapticPlugin shared] selection];
    }
    
    void _unityTapticImpact(int style) {
        [[UnityTapticPlugin shared] impact:(UIImpactFeedbackStyle) style];
    }
    
    bool _unityTapticIsSupport() {
        return [UnityTapticPlugin isSupport];
    }
}
