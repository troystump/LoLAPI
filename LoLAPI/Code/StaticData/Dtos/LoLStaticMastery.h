//
//  LoLStaticMastery.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"
#import "LoLStaticImage.h"


@interface LoLStaticMastery : LoLBaseDTO

@property (nonatomic, strong) NSArray *rawDescription; // List[string]
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) LoLStaticImage *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *prereq;
@property (nonatomic, assign) NSInteger ranks;
@property (nonatomic, strong) NSArray *sanitizedDescription; // List[string]

@end