//
//  LoLChampion.h
//  LoLAPI
//
//  Created by Troy Stump on 2/8/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLChampion : LoLBaseDTO

// properties
@property (nonatomic, assign) BOOL active;
@property (nonatomic, assign) BOOL botEnabled;
@property (nonatomic, assign) BOOL botMmEnabled;
@property (nonatomic, assign) BOOL freeToPlay;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) BOOL rankedPlayEnabled;


// methods
/* empty */

@end