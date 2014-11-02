//
//  LoLMiniSeries.h
//  LoLAPI
//
//  Created by Troy Stump on 4/26/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"


@interface LoLMiniSeries : LoLBaseDTO

@property (nonatomic, assign) NSInteger losses;
@property (nonatomic, strong) NSString *progress; // String showing the current, sequential mini series progress where 'W' represents a win, 'L' represents a loss, and 'N' represents a game that hasn't been played yet.
@property (nonatomic, assign) NSInteger target;
@property (nonatomic, assign) NSInteger wins;

@end