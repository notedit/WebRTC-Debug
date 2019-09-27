//
//  RTCClient.h
//  WebRTC-Debug
//
//  Created by xiang on 2019/9/27.
//  Copyright © 2019 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



#import <WebRTC/WebRTC.h>

#import "RTCStream.h"


@protocol  RTCClientDelegate;



@interface RTCClient : NSObject


@property (nonatomic,weak) id<RTCClientDelegate> _Nullable delegate;


- (nonnull instancetype) initWithDelegate:(id<RTCClientDelegate>) delegate;


- (void) publish:(RTCStream*) stream;

- (void) subscribe:(NSString*) streamId;


@end


@protocol RTCClientDelegate <NSObject>


- (void) rtcclient:(RTCClient *) client didStreamPublished:(RTCStream*) stream;

- (void) rtcclient:(RTCClient *) client didStreamSubscribed:(RTCStream*) stream;


@end

NS_ASSUME_NONNULL_END
