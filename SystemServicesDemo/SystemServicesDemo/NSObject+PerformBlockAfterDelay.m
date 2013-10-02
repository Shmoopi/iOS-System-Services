//
//  NSObject+PerformBlockAfterDelay.m
//  iEdit Any Browser
//
//  Created by Kramer on 11/21/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "NSObject+PerformBlockAfterDelay.h"

@implementation NSObject (PerformBlockAfterDelay)

// Perform something after a slight delay
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    // Copy the block
    block = [block copy];
    // Perform the block after a delay
    [self performSelector:@selector(fireBlockAfterDelay:) withObject:block afterDelay:delay];
}

// Do the block!
- (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}

@end
