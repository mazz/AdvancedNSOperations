//
//  DownloadEarthquakesOperation.m
//  ConditionalNetwork
//
//  Created by Michael Hanna on 2015-07-11.
//

#import "DownloadEarthquakesOperation.h"
#import "URLSessionTaskOperation.h"
#import "ReachabilityCondition.h"
#import "NetworkObserver.h"

@interface DownloadEarthquakesOperation()
@property (strong, nonatomic, nonnull) NSURL *cacheFile;
@end

@implementation DownloadEarthquakesOperation
/// - parameter cacheFile: The file `NSURL` to which the earthquake feed will be downloaded.
- (instancetype)initWithCacheFile:(nonnull NSURL *)cacheFile
{
    if ((self = [super initWithOperations:@[]]))
    {
        self.cacheFile = cacheFile;
        self.name = @"Download Earthquakes";
        
        NSURL *url = [[NSURL alloc] initWithString:@"http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_month.geojson"];
        NSURLSessionDownloadTask *task = [[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL * __nullable location, NSURLResponse * __nullable response, NSError * __nullable error) {
            [self downloadFinishedForURL:url response:(NSHTTPURLResponse *)response error:error];
        }];
        
        if (task != nil)
        {
            URLSessionTaskOperation *taskOperation = [[URLSessionTaskOperation alloc] initWithTask:task];
            
            ReachabilityCondition *reachabilityCondition = [[ReachabilityCondition alloc] initWithHost:url];
            [taskOperation addCondition:reachabilityCondition];
            
            NetworkObserver *networkObserver = [[NetworkObserver alloc] init];
            [taskOperation addObserver:networkObserver];
            
            [self addOperation:taskOperation];
        }
    }
    return self;
}

- (void)downloadFinishedForURL:(nonnull NSURL *)url response:(nullable NSHTTPURLResponse *)response error:(nullable NSError *)error
{
    NSLog(@"contents: %@", [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil]);
}

@end
