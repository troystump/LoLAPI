//
//  LoLMiniSeries.h
//  LoLAPI
//
//  Created by Troy Stump on 4/26/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"


@interface LoLMiniSeries : LoLBaseDTO

@property (nonatomic, strong) NSNumber *losses;
@property (nonatomic, strong) NSArray *progress; // char array
@property (nonatomic, strong) NSNumber *target;
@property (nonatomic, strong) NSNumber *wins;

@end