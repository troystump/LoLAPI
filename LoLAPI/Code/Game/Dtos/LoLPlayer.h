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

@property (nonatomic, assign) NSInteger championId;
@property (nonatomic, assign) NSInteger summonerId;
@property (nonatomic, assign) NSInteger teamId;

@end