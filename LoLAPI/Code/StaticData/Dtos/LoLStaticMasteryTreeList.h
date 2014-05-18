//
//  LoLStaticMasteryTreeList.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticMasteryTreeList : LoLBaseDTO

@property (nonatomic, strong) NSArray *masteryTreeItems; // List[MasteryTreeItemDto]

@end