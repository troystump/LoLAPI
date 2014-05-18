//
//  LoLSeasonHelper.h
//  LoLAPI
//
//  Created by Troy Stump on 4/28/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, LoLSeason)
{
    LoLSeasonCurrent = 0,
    LoLSeason3,
    LoLSeason4
};

@interface LoLSeasonHelper : NSObject

+ (NSString*)seasonAsString:(LoLSeason)season;

@end