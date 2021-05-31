//
//  TextService.h
//  TextService
//
//  Created by Eric Kampman on 5/31/21.
//

#import <Foundation/Foundation.h>
#import "TextServiceProtocol.h"

/* This file was auto-generated when I added the TextService XPC target. */


// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface TextService : NSObject <TextServiceProtocol>
@end
