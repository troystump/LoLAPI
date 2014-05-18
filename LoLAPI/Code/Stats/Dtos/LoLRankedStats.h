//
//  LoLRankedStats.h
//  LoLAPI
//
//  Created by Troy Stump on 4/27/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"


@interface LoLRankedStats : LoLBaseDTO

@property (nonatomic, strong) NSArray *champions; // list[championstats]
@property (nonatomic, strong) NSNumber *modifyDate;
@property (nonatomic, strong) NSNumber *summonerId;

@end