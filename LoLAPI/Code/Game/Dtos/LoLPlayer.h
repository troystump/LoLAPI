//
//  LoLPlayer.h
//  LoLAPI
//
//  Created by Troy Stump on 2/8/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLPlayer : LoLBaseDTO

@property (nonatomic, strong) NSNumber *championId;
@property (nonatomic, strong) NSNumber *summonerId;
@property (nonatomic, strong) NSNumber *teamId;

@end