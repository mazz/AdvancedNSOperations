//
//  DownloadEarthquakesOperation.h
//  ConditionalNetwork
//
//  Created by Michael Hanna on 2015-07-11.
//

#import "KADGroupOperation.h"

@interface DownloadEarthquakesOperation : KADGroupOperation
- (instancetype)initWithCacheFile:(nonnull NSURL *)cacheFile;
- (void)downloadFinishedForURL:(nonnull NSURL *)url response:(nullable NSHTTPURLResponse *)response error:(nullable NSError *)error;
@end
