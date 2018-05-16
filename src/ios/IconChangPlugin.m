/********* IconChangPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface IconChangPlugin : CDVPlugin {
  // Member variables go here.
}

- (void)checkSupport:(CDVInvokedUrlCommand*)command;
- (void)changeIcon:(CDVInvokedUrlCommand*)command;
@end

@implementation IconChangPlugin

// 检查手机是否支持
- (void)checkSupport:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// 更改icon
- (void)changeIcon:(CDVInvokedUrlCommand*)command
{
    NSString* iconName = [command.arguments objectAtIndex:0];
    
    if ([iconName isEqualToString:@"default"]) {
        iconName = nil;
    }
    
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

@end
