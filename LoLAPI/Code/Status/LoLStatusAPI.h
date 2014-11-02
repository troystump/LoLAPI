//
//  LoLStatusAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseAPI.h"
#import "LoLRegionHelper.h"
// dtos
#import "LoLShard.h"
#import "LoLShardStatus.h"


@interface LoLStatusAPI : LoLBaseAPI

// properties
/* empty */


// methods
- (void)getShardsWithSuccess:(void(^)(NSArray *shards))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getShardStatusWithRegion:(LoLRegionID)region success:(void(^)(LoLShardStatus *shardStatus))successBlock failure:(void(^)(NSError *error))failureBlock;

@end