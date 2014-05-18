//
//  LoLStaticMasteryTreeItem.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticMasteryTreeItem : LoLBaseDTO

@property (nonatomic, strong) NSNumber *masteryId;
@property (nonatomic, strong) NSString *prereq;

@end