//
//  TKModule.h
//  TKModule
//
//  Created by Thief Toki on 2021/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TKModuleUnrecognizedSelectorCallback)(SEL);

@interface TKModule : NSObject

@property (nonatomic, strong) TKModuleUnrecognizedSelectorCallback unrecognizedSelectorCallback;

+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
