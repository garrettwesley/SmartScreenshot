//
//  main.m
//  SmartScreenshot
//
//  Created by Garrett Wesley on 12/30/18.
//  Copyright © 2018 Garrett Wesley. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
