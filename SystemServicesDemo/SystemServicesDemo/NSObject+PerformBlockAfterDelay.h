//
//  NSObject+PerformBlockAfterDelay.h
//  iEdit Any Browser
//
//  Created by Kramer on 11/21/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PerformBlockAfterDelay)

// Perform something after a slight delay
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
