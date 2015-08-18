//
//  MobileAnalyticsHelper.m
//  MobileAnalyticsHelper
//
//  Created by Eric Abbott on 8/18/15.
//  Copyright (c) 2015 SkySlope. All rights reserved.
//

#import "MobileAnalyticsHelper.h"

static MobileAnalyticsHelper *helper;

@implementation MobileAnalyticsHelper

+(MobileAnalyticsHelper *)sharedHelper {
    if (helper == nil) {
        helper = [[MobileAnalyticsHelper alloc] init];
    }
    return helper;
}

-(id)init {
    if (self = [super init]) {
        analytics = [AWSMobileAnalytics mobileAnalyticsForAppId:AWS_APP_ID identityPoolId:AWS_COGNITO_ID];
    }
    return self;
}

-(void)sendCustomAnalytics:(NSString *)eventName withAttributes:(NSDictionary *)attributes {
    NSArray *keys = [attributes allKeys];
    id<AWSMobileAnalyticsEventClient> client = analytics.eventClient;
    id<AWSMobileAnalyticsEvent> event = [client createEventWithEventType:eventName];
    
    for (NSString *key in attributes) {
        if ([attributes[key] isKindOfClass:[NSNumber class]]) {
            [event addMetric:attributes[key] forKey:key];
        }
        else {
            [event addAttribute:attributes[key] forKey:key];;
        }
    }
    [client recordEvent:event];
}

@end
