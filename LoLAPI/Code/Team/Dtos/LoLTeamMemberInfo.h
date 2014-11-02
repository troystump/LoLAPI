//
//  LoLTeamMemberInfo.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLTeamMemberInfo : LoLBaseDTO

@property (nonatomic, strong) NSDate *inviteDate;
@property (nonatomic, strong) NSDate *joinDate;
@property (nonatomic, assign) NSInteger playerId;
@property (nonatomic, strong) NSString *status;

@end