//
//  TextService.m
//  TextService
//
//  Created by Eric Kampman on 5/31/21.
//

#import "TextService.h"

@implementation TextService

/* This file was auto-generated when I added the TextService XPC target. */


// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
