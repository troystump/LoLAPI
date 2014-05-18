//
//  LoLRegionInfo.m
//  LoLAPI
//
//  Created by Troy Stump on 2/16/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLRegionInfo.h"
#import "LoLRegionHelper.h"


@implementation LoLRegionInfo

- (id)initWithRegion:(LoLRegionID)region
{
    if (self = [super init]) {
            _uid = region;
            
            switch (_uid) {
                case LoLRegionIDBrazil:
                    _name = @"Brazil";
                    _value = @"br";
                    break;
                case LoLRegionIDEuropeNordicAndEast:
                    _name = @"Europe Nordic and East";
                    _value = @"eune";
                    break;
                case LoLRegionIDEuropeWest:
                    _name = @"Europe West";
                    _value = @"euw";
                    break;
                case LoLRegionIDKorea:
                    _name = @"Korea";
                    _value = @"kr";
                    break;
                case LoLRegionIDLatinAmericaNorth:
                    _name = @"Latin America North";
                    _value = @"lan";
                    break;
                case LoLRegionIDLatinAmericaSouth:
                    _name = @"Latin America South";
                    _value = @"las";
                    break;
                case LoLRegionIDNorthAmerica:
                    _name = @"North America";
                    _value = @"na";
                    break;
                case LoLRegionIDOceania:
                    _name = @"Oceania";
                    _value = @"oce";
                    break;
                case LoLRegionIDRussia:
                    _name = @"Russia";
                    _value = @"ru";
                    break;
                case LoLRegionIDTurkey:
                    _name = @"Turkey";
                    _value = @"tr";
                    break;
                default:
                    /* empty */
                    break;
            }
        }
    
    return self;
}

@end
