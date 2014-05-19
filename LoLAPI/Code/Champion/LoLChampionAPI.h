//
//  LoLChampionAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseAPI.h"
#import "LoLChampionList.h"
#import "LoLChampion.h"


@interface LoLChampionAPI : LoLBaseAPI

// properties
/* empty */


// methods
- (void)getChampionsWithFreeToPlayStatusOnly:(BOOL)isFreeToPlay usingAPIKey:(NSString*)apiKey success:(void(^)(LoLChampionList *champions))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getChampionWithID:(NSInteger)championID usingAPIKey:(NSString*)apiKey success:(void(^)(LoLChampion *champion))successBlock failure:(void(^)(NSError *error))failureBlock;

@end