//
//  ReachabilityCondition.m
//  AdvancedNSOperation
//
//  Created by Andrey K. on 05.07.15.
//  Copyright (c) 2015 Andrey K. All rights reserved.
//

#import "ReachabilityCondition.h"

static NSString * hostKey = @"Host";
static NSString * name = @"Reachability";

@interface ReachabilityCondition ()
{
    NSURL * _host;
}
@end
@implementation ReachabilityCondition
-(instancetype)initWithHost:(nonnull NSURL *)host
{
    if (self = [super init]){
        _host = host;
    }
    return self;
}

#pragma mark - Condition
-(NSString *)name
{
    return NSStringFromClass(self.class);
}

-(BOOL)isMutuallyExclusive
{
    return NO;
}

-(void)evaluateForOperation:(KADOperation *)operation completion:(void(^)(KADOperationConditionResult *))completion
{
    
}
//- (void)evaluateForOperation:(KADOperation * __nonnull)operation withCompletion:(void (^ __nullable)(KADOperationConditionResult * __nonnull result))completion;
//{
//    // check reachability for _host via any convenient wrapper and return condition result
//}

- (NSOperation * __nullable)dependencyForOperation:(KADOperation* __nonnull )operation
{
    return nil;
}
@end
