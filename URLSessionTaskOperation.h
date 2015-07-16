//
//  URLSessionTaskOperation.h
//  ConditionalNetwork
//
//  Created by Michael Hanna on 2015-07-13.
//

#import "KADOperation.h"

@interface URLSessionTaskOperation : KADOperation
- (nonnull instancetype)initWithTask:(nonnull NSURLSessionTask *)task;
@end
