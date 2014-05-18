//
//  LoLStaticRecommended.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticRecommended : LoLBaseDTO

@property (nonatomic, strong) NSArray *blocks; // List[BlockDto]
@property (nonatomic, strong) NSString *champion;
@property (nonatomic, strong) NSString *map;
@property (nonatomic, strong) NSString *mode;
@property (nonatomic, assign) BOOL priority;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;

@end