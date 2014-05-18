//
//  LoLStaticImage.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticImage : LoLBaseDTO

@property (nonatomic, strong) NSString *full;
@property (nonatomic, strong) NSString *group;
@property (nonatomic, strong) NSNumber *h;
@property (nonatomic, strong) NSString *sprite;
@property (nonatomic, strong) NSNumber *w;
@property (nonatomic, strong) NSNumber *x;
@property (nonatomic, strong) NSNumber *y;

@end