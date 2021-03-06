//
//  LoLPlayerStatsSummaryList.h
//  LoLAPI
//
//  Created by Troy Stump on 4/27/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"


@interface LoLPlayerStatsSummaryList : LoLBaseDTO

@property (nonatomic, strong) NSArray *playerStatSummaries; // List[PlayerStatsSummary]
@property (nonatomic, assign) NSInteger summonerId;

@end