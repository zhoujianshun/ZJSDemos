//
//  ZJSReferenceMacros.h
//  ZJSDemos
//
//  Created by 周建顺 on 2018/9/5.
//  Copyright © 2018年 周建顺. All rights reserved.
//

#ifndef ZJSReferenceMacros_h
#define ZJSReferenceMacros_h
//
//#define ZJSWeakObj(o) autoreleasepool{} __weak __typeof(o) weak##o = o; // weak 宏 用法 @MXRWeakObj(self);
//#define ZJSStrongObj(o) autoreleasepool{} __strong __typeof(o) o = weak##o;// strong 宏

#define ZJSWeakObj(o)  __weak __typeof(o) weak##o = o; // weak 宏 用法 @MXRWeakObj(self);
#define ZJSStrongObj(o) __strong __typeof(o) o = weak##o;// strong 宏

#endif /* ZJSReferenceMacros_h */
