//
//  LoLStaticLevelTip.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticLevelTip : LoLBaseDTO

@property (nonatomic, strong) NSArray *effect; // List[string]
@property (nonatomic, strong) NSArray *label; // List[string]

@end