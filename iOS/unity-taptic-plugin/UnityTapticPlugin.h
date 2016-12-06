//
//  UnityTapticPlugin.h
//  unity-taptic-plugin
//
//  Created by Koki Ibukuro on 12/6/16.
//  Copyright © 2016 asus4. All rights reserved.
//
#ifndef UnityTapticPlugin_h
#define UnityTapticPlugin_h

#import <UIKit/UIKit.h>


@interface UnityTapticPlugin : NSObject{

}
+ (UnityTapticPlugin*) shared;
- (void) notification:(UINotificationFeedbackType) type;
- (void) selection;
- (void) impact:(UIImpactFeedbackStyle) style;

+ (BOOL) isSupport;

@end

#endif /* UnityTapticPlugin_h */
