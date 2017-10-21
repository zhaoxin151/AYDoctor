//
//  UIWebView+ExportHTML.m
//  NTOFFICE_TS
//
//  Created by iMcG33k on 16/6/27.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import "UIWebView+ExportHTML.h"

@implementation UIWebView (ExportHTML)


- (BOOL)exportHTMLToDeskDirWithUserName:(NSString *)userName {
  NSString *htmlStr = [self stringByEvaluatingJavaScriptFromString:@"document.documentElement.innerHTML"];
  NSError *err;
  NSString *path = [NSString stringWithFormat:@"/Users/%@/Desktop/test.html", userName];
  [htmlStr writeToFile:path atomically:NO encoding:NSUTF8StringEncoding error:&err];
  return err? YES:NO;
}

@end
