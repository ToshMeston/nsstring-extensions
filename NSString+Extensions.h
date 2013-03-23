//
//  NSString+Extensions.h
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)

- (int)parseIntWithDefaultValue:(int)defaultValue;
- (NSString *)trim;
- (NSString *)urlDecode;
- (NSString *)urlEncode;
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

@end