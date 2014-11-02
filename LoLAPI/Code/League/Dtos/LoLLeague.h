//
//  LoLLeague.h
//  LoLAPI
//
//  Created by Troy Stump on 4/26/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"


@interface LoLLeague : LoLBaseDTO

@property (nonatomic, strong) NSArray *entries;
@property (nonatomic, strong) NSString *name; // This name is an internal place-holder name only. Display and localization of names in the game client are handled client-side.
@property (nonatomic, strong) NSString *participantId; // Specifies the relevant participant that is a member of this league (i.e., a requested summoner ID, a requested team ID, or the ID of a team to which one of the requested summoners belongs). Only present when full league is requested so that participant's entry can be identified. Not present when individual entry is requested.
@property (nonatomic, strong) NSString *queue;
@property (nonatomic, strong) NSString *tier;

@end