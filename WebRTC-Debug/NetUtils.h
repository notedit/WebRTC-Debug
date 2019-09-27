//
//  NetUtils.h
//  WebRTC-Debug
//
//  Created by xiang on 2019/9/27.
//  Copyright © 2019 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (UrlEncoding)

-(NSString*) urlEncodedString;

@end


@interface NetUtils : NSObject


+(void)postWithParams:(NSDictionary*)params url:(NSString*)url  withBlock:(void (^)(NSDictionary* response, NSError* error))block;


@end

NS_ASSUME_NONNULL_END
