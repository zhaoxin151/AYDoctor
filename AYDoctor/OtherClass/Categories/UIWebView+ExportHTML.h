//
//  UIWebView+ExportHTML.h
//  NTOFFICE_TS
//
//  Created by iMcG33k on 16/6/27.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (ExportHTML)

/**
 * ! 仅用于模拟器测试时 ! 将当前webView的HTML内容导出到本地电脑桌面test.html文件
 *
 *  @param userName /Users/#当前用户名#/Desktop/
 *
 *  @return 是否成功写入
 */
- (BOOL)exportHTMLToDeskDirWithUserName:(NSString *)userName;
@end
