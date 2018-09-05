//
//  NSString+ZJSURL.m
//  ZJSDemos
//
//  Created by 周建顺 on 2018/8/31.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import "NSString+ZJSURL.h"

@implementation NSString (ZJSURL)


/**
 URL encode

 @param unencodedString unencodedString
 @return encodedString
 */
-(NSString*)urlEncodeString:(NSString*)unencodedString{
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL,kCFStringEncodingUTF8));
#pragma clang diagnostic pop

    
}

/**
 URL decode

 @param encodedString encodedString
 @return decodeString
 */
-(NSString*)urlDecodeString:(NSString*)encodedString
{
    
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    NSString *decodedString = (__bridge_transfer NSString*)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,(__bridge CFStringRef)encodedString,CFSTR(""),CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
#pragma clang diagnostic pop
    return decodedString;
    
}


@end
