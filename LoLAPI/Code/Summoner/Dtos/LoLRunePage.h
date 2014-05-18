//
//  LoLRunePage.h
//  LoLAPI
//
//  Created by Troy Stump on 2/5/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLRunePage : LoLBaseDTO

@property (nonatomic, assign) BOOL current;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *slots;

@end