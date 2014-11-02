//
//  LoLChampionStats.h
//  LoLAPI
//
//  Created by Troy Stump on 4/27/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"
#import "LoLAggregatedStats.h"


@interface LoLChampionStats : LoLBaseDTO

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) LoLAggregatedStats *stats;

@end