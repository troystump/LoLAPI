//
//  LoLMastery.h
//  LoLAPI
//
//  Created by Troy Stump on 2/5/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLMastery : LoLBaseDTO

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *rank;

@end