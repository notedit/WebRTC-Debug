//
//  RTCClient.m
//  WebRTC-Debug
//
//  Created by xiang on 2019/9/27.
//  Copyright © 2019 xiang. All rights reserved.
//

#import "RTCClient.h"



@interface RTCClient()
{
    

}



@end


@implementation RTCClient


-(instancetype) initWithDelegate:(id<RTCClientDelegate>)delegate
{
    
    if (self = [super init]) {
        _delegate = delegate;
    }
    
    return self;
}

- (void) publish:(RTCStream*) stream
{
    
    
}

- (void) subscribe:(NSString*) streamId
{
    
    
    
}

@end
