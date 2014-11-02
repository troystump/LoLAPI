//
//  LoLStaticMasteryTreeItem.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticMasteryTreeItem : LoLBaseDTO

@property (nonatomic, assign) NSInteger masteryId;
@property (nonatomic, strong) NSString *prereq;

@end