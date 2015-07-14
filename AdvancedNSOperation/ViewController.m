//
//  ViewController.m
//  AdvancedNSOperation
//
//  Created by Andrey K. on 01.07.15.
//  Copyright (c) 2015 Andrey K. All rights reserved.
//

#import "ViewController.h"
#import "KADOperationQueue.h"
#import "DownloadEarthquakesOperation.h"

@interface ViewController ()
@property (strong, nonatomic, nonnull) KADOperationQueue *operationQueue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.operationQueue = [[KADOperationQueue alloc] init];
    
    NSURL *cacheFolder = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *cacheFile = [cacheFolder URLByAppendingPathComponent:@"earthquakes.json"];
    
    DownloadEarthquakesOperation *downloadOperation = [[DownloadEarthquakesOperation alloc] initWithCacheFile:cacheFile];
    /*
     This operation is made of three child operations:
     1. The operation to download the JSON feed
     2. The operation to parse the JSON feed and insert the elements into the Core Data store
     3. The operation to invoke the completion handler
     */
    
    [self.operationQueue addOperation:downloadOperation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
