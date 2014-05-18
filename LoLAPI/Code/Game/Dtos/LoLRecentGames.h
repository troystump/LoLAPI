//
//  LoLRecentGames.h
//  LoLAPI
//
//  Created by Troy Stump on 2/8/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLRecentGames : LoLBaseDTO

@property (nonatomic, strong) NSMutableArray *games;
@property (nonatomic, strong) NSNumber *summonerId;

@end