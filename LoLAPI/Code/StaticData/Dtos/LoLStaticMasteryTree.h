//
//  LoLStaticMasteryTree.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticMasteryTree : LoLBaseDTO

@property (nonatomic, strong) NSArray *Defense; // List[MasteryTreeListDto]
@property (nonatomic, strong) NSArray *Offense; // List[MasteryTreeListDto]
@property (nonatomic, strong) NSArray *Utility; // List[MasteryTreeListDto]

@end