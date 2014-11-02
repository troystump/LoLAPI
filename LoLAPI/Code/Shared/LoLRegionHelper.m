//
//  LoLRegionHelper.m
//  LoLAPI
//
//  Created by Troy Stump on 2/11/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLRegionHelper.h"
#import "LoLRegionInfo.h"


static NSDictionary *regions;

@implementation LoLRegionHelper

+ (void)initRegions
{
    if (!regions) {
        regions = @{
                    @(LoLRegionIDBrazil) : [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDBrazil],
                    @(LoLRegionIDEuropeNordicAndEast) : [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDEuropeNordicAndEast],
                    @(LoLRegionIDEuropeWest) : [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDEuropeWest],
                    @(LoLRegionIDKorea) : [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDKorea],
                    @(LoLRegionIDLatinAmericaNorth): [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDLatinAmericaNorth],
                    @(LoLRegionIDLatinAmericaSouth): [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDLatinAmericaSouth],
                    @(LoLRegionIDNorthAmerica): [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDNorthAmerica],
                    @(LoLRegionIDOceania): [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDOceania],
                    @(LoLRegionIDRussia): [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDRussia],
                    @(LoLRegionIDTurkey): [[LoLRegionInfo alloc] initWithRegion:LoLRegionIDTurkey]
                    };
    }
}


+ (NSDictionary*)getRegions
{
    [self initRegions];
    
    return regions;
}


+ (LoLRegionInfo*)getRegionWithID:(LoLRegionID)regionID
{
    [self initRegions];
        
    return [regions objectForKey:@(regionID)];
}


// NSArray is array of LoLRegionID enum values wrapped in NSNumber
+ (NSDictionary*)getRegionsWithIDs:(NSArray*)regionIDs
{
    NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc] init];
    LoLRegionInfo *tempRegion;
    
    
    [self initRegions];
    
    for (NSNumber *regionID in regionIDs) {
        tempRegion = [regions objectForKey:regionID];
        
        [resultDictionary setObject:tempRegion forKey:@(tempRegion.uid)];
    }
    
    return resultDictionary;
}


+ (NSURL*)hostURLWithRegionID:(LoLRegionID)regionID
{
    NSString *regionHostURL;
    
    
    switch (regionID) {
        case LoLRegionIDBrazil:
        {
            regionHostURL = @"https://br.api.pvp.net/";
            break;
        }
        case LoLRegionIDEuropeNordicAndEast:
        {
            regionHostURL = @"https://eune.api.pvp.net/";
            break;
        }
        case LoLRegionIDEuropeWest:
        {
            regionHostURL = @"https://euw.api.pvp.net/";
            break;
        }
        case LoLRegionIDKorea:
        {
            regionHostURL = @"https://kr.api.pvp.net/";
            break;
        }
        case LoLRegionIDLatinAmericaNorth:
        {
            regionHostURL = @"https://lan.api.pvp.net/";
            break;
        }
        case LoLRegionIDLatinAmericaSouth:
        {
            regionHostURL = @"https://las.api.pvp.net/";
            break;
        }
        case LoLRegionIDNorthAmerica:
        {
            regionHostURL = @"https://na.api.pvp.net/";
            break;
        }
            case LoLRegionIDOceania:
        {
            regionHostURL = @"https://oce.api.pvp.net/";
            break;
        }
        case LoLRegionIDRussia:
        {
            regionHostURL = @"https://ru.api.pvp.net/";
            break;
        }
        case LoLRegionIDTurkey:
        {
            regionHostURL = @"https://tr.api.pvp.net/";
            break;
        }
        default:
        {
            break;
            regionHostURL = @"https://na.api.pvp.net/";
        }
    }
    
    return [NSURL URLWithString:regionHostURL];
}

@end