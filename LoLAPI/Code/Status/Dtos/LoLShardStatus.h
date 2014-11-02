//
//  LoLShardStatus.h
//  LoLAPI
//
//  Created by Troy Stump on 10/25/14.
//
//

#import "LoLShard.h"


@interface LoLShardStatus : LoLShard

@property (nonatomic, strong) NSArray* services; // List[Service]

@end