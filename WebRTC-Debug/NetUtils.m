//
//  NetUtils.m
//  WebRTC-Debug
//
//  Created by xiang on 2019/9/27.
//  Copyright © 2019 xiang. All rights reserved.
//

#import "NetUtils.h"


static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

// helper function: get the url encoded string form of any object
static NSString *urlEncode(id object) {
    NSString *string = toString(object);
    return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
}




static NSString* parameterStringWithParameters(NSDictionary * parameters)
{
    NSMutableArray *components = [NSMutableArray array];
    
    for (id key in parameters) {
        id value = [parameters objectForKey:key];
        
        NSString *component = [NSString stringWithFormat:@"%@=%@", key, value];
        [components addObject:component];
    }
    
    return [components componentsJoinedByString:@"&"];
}


@implementation NSDictionary (UrlEncoding)

-(NSString*) urlEncodedString {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}

@end





@implementation NetUtils

+(void)postWithParams:(NSDictionary *)params url:(NSString*)url withBlock:(void (^)( NSDictionary*, NSError *))block
{
    
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    request.HTTPBody = [[params urlEncodedString] dataUsingEncoding:NSUTF8StringEncoding];
    
    request.HTTPMethod = @"POST";
    
    NSURLSession* session =  [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                              ];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            block(nil, error);
            return;
        }
        
        
        if (block) {
            
            if (error) {
                block(nil,error);
                return;
            }
            
            NSDictionary *responseData = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if (!responseData) {
                error = [NSError errorWithDomain:@"webrtc.error" code:0 userInfo:nil];
                block(nil,error);
                return;
            }
          
            block(responseData, nil);
        }
        
    }];
    
    [postDataTask resume];
}


@end
