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
@property (nonatomic, assign) NSInteger h;
@property (nonatomic, strong) NSString *sprite;
@property (nonatomic, assign) NSInteger w;
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

@end