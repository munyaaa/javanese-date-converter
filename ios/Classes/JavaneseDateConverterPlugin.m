#import "JavaneseDateConverterPlugin.h"
#if __has_include(<javanese_date_converter/javanese_date_converter-Swift.h>)
#import <javanese_date_converter/javanese_date_converter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "javanese_date_converter-Swift.h"
#endif

@implementation JavaneseDateConverterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftJavaneseDateConverterPlugin registerWithRegistrar:registrar];
}
@end
