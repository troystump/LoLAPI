//
//  LoLPlayerStatsSummary.h
//  LoLAPI
//
//  Created by Troy Stump on 4/27/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"
#import "LoLAggregatedStats.h"


@interface LoLPlayerStatsSummary : LoLBaseDTO

@property (nonatomic, strong) LoLAggregatedStats *aggregatedStats;
@property (nonatomic, assign) NSInteger losses;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSString *playerStatSummaryType;
@property (nonatomic, assign) NSInteger wins;

@end