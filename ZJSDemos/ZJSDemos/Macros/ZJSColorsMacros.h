//
//  ZJSColorsMacros.h
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/3.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#ifndef ZJSColorsMacros_h
#define ZJSColorsMacros_h

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

// 16进制
#define RGBHEXA(hex ,a) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:a]
#define RGBHEX(hex) RGBHEXA(hex, 1)

#endif /* ZJSColorsMacros_h */
