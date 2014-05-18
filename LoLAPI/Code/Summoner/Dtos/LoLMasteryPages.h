//
//  LoLMasteryPages.h
//  LoLAPI
//
//  Created by Troy Stump on 2/5/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLMasteryPages : LoLBaseDTO

@property (nonatomic, strong) NSArray *pages;
@property (nonatomic, strong) NSNumber *summonerId;

@end