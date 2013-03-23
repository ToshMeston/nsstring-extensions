//
//  NSString+Extensions.m
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

- (int)parseIntWithDefaultValue:(int)defaultValue
{
    NSNumberFormatter *formatter;
    NSNumber *number;
    
    formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    
    number = [formatter numberFromString:self];
    
    return (number != nil) ? [number intValue] : defaultValue;
}

- (NSString *)trim
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)urlDecode
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlEncode
{
	return [self urlEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding 
{
	return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
															   NULL,
															   (__bridge CFStringRef)self,
															   NULL,
															   (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
															   CFStringConvertNSStringEncodingToEncoding(encoding)));
}

@end