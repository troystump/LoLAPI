//
//  LoLStaticRealm.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticRealm : LoLBaseDTO

@property (nonatomic, strong) NSString *cdn; // The base CDN url.
@property (nonatomic, strong) NSString *css; // Latest changed version of Dragon Magic's css file.
@property (nonatomic, strong) NSString *dd; // Latest changed version of Dragon Magic.
@property (nonatomic, strong) NSString *l; // Default language for this realm.
@property (nonatomic, strong) NSString *lg; // Legacy script mode for IE6 or older.
@property (nonatomic, strong) NSDictionary *n; // Map[string, string] Latest changed version for each data type listed.
@property (nonatomic, strong) NSNumber *profileiconmax; // Special behavior number identifying the largest profileicon id that can be used under 500. Any profileicon that is requested between this number and 500 should be mapped to 0.
@property (nonatomic, strong) NSString *store; // Additional api data drawn from other sources that may be related to data dragon functionality.
@property (nonatomic, strong) NSString *v; // Current version of this file for this realm.

@end