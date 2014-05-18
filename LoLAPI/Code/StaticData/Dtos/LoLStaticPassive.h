//
//  LoLStaticPassive.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"
#import "LoLStaticImage.h"

@interface LoLStaticPassive : LoLBaseDTO

@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) LoLStaticImage *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sanitizedDescription;

@end