//
//  ZJSDebugMacros.h
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/5.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#ifndef ZJSDebugMacros_h
#define ZJSDebugMacros_h

// DEBUG
#ifdef DEBUG

#define DLog(format, ...) NSLog(format, ## __VA_ARGS__);
#define DLogFuncInfo(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#define DLOG_METHOD NSLog(@"%s",__func__);

#else

#define DLog(...);
#define DLogFuncInfo(fmt, ...)
#define DLOG_METHOD

#endif

#endif /* ZJSDebugMacros_h */
