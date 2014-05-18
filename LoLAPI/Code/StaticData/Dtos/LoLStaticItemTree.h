//
//  LoLStaticItemTree.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticItemTree : LoLBaseDTO

@property (nonatomic, strong) NSString *header;
@property (nonatomic, strong) NSArray *tags; // List[string]

@end