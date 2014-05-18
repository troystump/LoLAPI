//
//  LoLSeasonHelper.m
//  LoLAPI
//
//  Created by Troy Stump on 4/28/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLSeasonHelper.h"


@implementation LoLSeasonHelper

+ (NSString*)seasonAsString:(LoLSeason)season
{
    static NSDictionary *seasonDictionary;
    static dispatch_once_t onceToken;
    NSString *resultSeason;
    
    
    dispatch_once(&onceToken, ^{
        seasonDictionary = @{
                             @(LoLSeason3) : @"SEASON_3",
                             @(LoLSeason4) : @"SEASON_4"
                             };
    });
    
    resultSeason = [seasonDictionary objectForKey:@(season)];
    
    return resultSeason ? resultSeason : @"";
}

@end