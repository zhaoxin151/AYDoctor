
// Chinese support for array, dictionary, set
// also applies to mutable version.
// Usage: Just add to your project, and have fun.

#import <Foundation/Foundation.h>

@implementation NSDictionary (LogChinese)
- (NSString *)descriptionWithLocale:(id)locale
{
  NSMutableString *str = [NSMutableString string];
  
  [str appendString:@"{\n"];
  
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    [str appendFormat:@"\t%@ = %@,\n", key, obj];
  }];
  
  [str appendString:@"}"];
  
  // delete redundant comma
  NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
  
  if (range.length) {
    [str deleteCharactersInRange:range];
  }
  
  return str;
}
@end

@implementation NSArray (LogChinese)
- (NSString *)descriptionWithLocale:(id)locale
{
  NSMutableString *str = [NSMutableString string];
  
  [str appendString:@"[\n"];
  
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [str appendFormat:@"\t%@,\n", obj];
  }];
  
  [str appendString:@"]"];
  
  NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
  if (range.length) {
    [str deleteCharactersInRange:range];
  }
  
  return str;
}
@end

@implementation NSSet (LogChinese)

- (NSString *)descriptionWithLocale:(id)locale
{
  NSMutableString *str = [NSMutableString string];
  
  [str appendString:@"{(\n"];
  
  [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
    [str appendFormat:@"\t%@,\n", obj];
  }];
  
  [str appendString:@")}"];
  
  NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
  
  if (range.length) {
    [str deleteCharactersInRange:range];
  }
  
  return str;
}
@end
