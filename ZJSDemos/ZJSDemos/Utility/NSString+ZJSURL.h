//
//  NSString+ZJSURL.h
//  ZJSDemos
//
//  Created by 周建顺 on 2018/8/31.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZJSURL)

/**
 URL encode
 
 @param unencodedString unencodedString
 @return encodedString
 */
-(NSString*)urlEncodeString:(NSString*)unencodedString;

/**
 URL decode
 
 @param encodedString encodedString
 @return decodeString
 */
-(NSString*)urlDecodeString:(NSString*)encodedString;

@end
