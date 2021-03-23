//
//  TKModule.m
//  TKModule
//
//  Created by Thief Toki on 2021/3/23.
//

#import "TKModule.h"

#import <objc/runtime.h>

@implementation TKModule

#pragma mark - shared

+ (instancetype)shared {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - Unrecognized

- (NSMethodSignature*)methodSignatureForSelector:(SEL)selector {
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (!signature) {
        if (self.unrecognizedSelectorCallback) {
            self.unrecognizedSelectorCallback(selector);
        }
        signature = self.voidSignature;
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    if (![invocation.methodSignature isEqual:self.voidSignature]) {
        [super forwardInvocation:invocation];
    }
}

#pragma mark - util

- (NSMethodSignature *)voidSignature {
    return [self methodSignatureForSelector:@selector(unrecognizedSelectorBackUp)];
}

- (void)unrecognizedSelectorBackUp {
    
}

@end
