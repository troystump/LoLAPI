//
//  LoLRoster.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLRoster : LoLBaseDTO

@property (nonatomic, strong) NSArray *memberList; // List[TeamMemberInfoDto]
@property (nonatomic, strong) NSNumber *ownerId;

@end