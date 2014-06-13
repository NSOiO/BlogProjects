//
//  UIScreenEdgePanGestureRecognizer+replace.m
//  Gesture_Pop_iOS7+
//
//  Created by handaer on 14-6-13.
//  Copyright (c) 2014年 yes. All rights reserved.
//

#import "UIScreenEdge/Users/handaer/Desktop/work/blog/BlogProjects/gesture_pop_ios7+/Gesture_Pop_iOS7+/Gesture_Pop_iOS7+/DPGesturePopViewController.xibPanGestureRecognizer+replace.h"
#import <objc/runtime.h>

BOOL enableGesturePop;
void MethodSwizzle(Class c, SEL origSEL, SEL overrideSEL);

@implementation UIScreenEdgePanGestureRecognizer (replace)


+ (void)load{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle([self class], @selector(initWithTarget:action:), @selector(initPanWithTarget:action:));
    });
    
}

- (id)initPanWithTarget:(id)target action:(SEL)action{
    
    if (enableGesturePop) {
        enableGesturePop = NO;
        self = (UIScreenEdgePanGestureRecognizer *)[[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    } else {
        self = [self initPanWithTarget:target action:action];
    }
    return self;
}

@end

@implementation UIPanGestureRecognizer (replace_screenEdgePan)

- (void)setEdges:(UIRectEdge)edges{
    NSLog(@"%d",edges);
}

@end

void MethodSwizzle(Class c, SEL origSEL, SEL overrideSEL){
    
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method overrideMethod = class_getInstanceMethod(c, overrideSEL);
    
    method_exchangeImplementations(origMethod, overrideMethod);
    
}

