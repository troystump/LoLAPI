//
//  LoLRunePages.h
//  LoLAPI
//
//  Created by Troy Stump on 2/5/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLRunePages : LoLBaseDTO

@property (nonatomic, strong) NSArray *pages; // Set[RunePageDto]
@property (nonatomic, assign) NSInteger summonerId;

@end