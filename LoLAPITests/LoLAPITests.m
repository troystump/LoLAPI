//
//  LoLAPITests.m
//  LoLAPITests
//
//  Created by Troy Stump on 5/17/14.
//
//

#import <XCTest/XCTest.h>
#import "LoLAPI.h"


@interface LoLAPITests : XCTestCase

@end

@implementation LoLAPITests

- (void)setUp
{
    [super setUp];

    [LoLAPIManager initWithAPIKey:@"" region:LoLRegionIDNorthAmerica];
}


- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testChampionAPI
{
    __block NSArray *champions;
    
    
    hxRunInMainLoop(^(BOOL *done) {
        [LoLAPIManager getChampionsWithFreeToPlayStatusOnly:NO
                                                    success:^(LoLChampionList *championList) {
                                                        *done = YES;
                                                    }
                                                    failure:^(NSError *error) {
                                                        *done = YES;
                                                    }];
    });
    
    XCTAssertNil(champions, @"failed to get champion data");
}


- (void)testKoreanHostname
{
    [LoLAPIManager setSelectedRegion:LoLRegionIDKorea];
    
    [self testChampionAPI];
}


// wrapper to test asyncronous methods
static inline void hxRunInMainLoop(void(^block)(BOOL *done)) {
    __block BOOL done = NO;
    
    block(&done);
    
    while(!done) {
        [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:.1]];
    }
}

@end
