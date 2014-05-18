//
//  LoLStaticBlock.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticBlock : LoLBaseDTO

@property (nonatomic, strong) NSArray *items; // List[BlockItemDto]
@property (nonatomic, assign) BOOL recMath;
@property (nonatomic, strong) NSString *type;

@end