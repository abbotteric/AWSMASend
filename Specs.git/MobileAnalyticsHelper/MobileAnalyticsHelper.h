//
//  MobileAnalyticsHelper.h
//  MobileAnalyticsHelper
//
//  Created by Eric Abbott on 8/18/15.
//  Copyright (c) 2015 SkySlope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AWSMobileAnalytics.h>

#define AWS_APP_ID @"7b130f0755be411ca44546dd8d438499"
#define AWS_COGNITO_ID @"us-east-1:bf57347b-a51b-4ee2-a0bd-bea93fa1172f"

@interface MobileAnalyticsHelper : NSObject {
    AWSMobileAnalytics *analytics;
}

+(MobileAnalyticsHelper *)sharedHelper;
-(void)sendCustomAnalytics:(NSString *)eventName withAttributes:(NSDictionary *)attributes;


@end
