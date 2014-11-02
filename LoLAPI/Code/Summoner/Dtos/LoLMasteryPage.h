//
//  LoLMasteryPage.h
//  LoLAPI
//
//  Created by Troy Stump on 2/5/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLMasteryPage : LoLBaseDTO

@property (nonatomic, assign) BOOL current;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSArray *masteries; // List[MasteryDto]
@property (nonatomic, strong) NSString *name;

@end