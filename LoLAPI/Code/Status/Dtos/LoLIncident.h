//
//  LoLIncident.h
//  LoLAPI
//
//  Created by Troy Stump on 10/26/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLIncident : LoLBaseDTO

@property (nonatomic, assign) BOOL active;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSArray *updates; // List[Message]

@end