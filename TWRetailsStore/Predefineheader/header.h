//
//  header.h
//  C-NotE
//
//  Created by Radhika Dambhare on 31/07/17.
//  Copyright © 2017 Radhika Dambhare. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef header_h
#define header_h

#pragma Mark

// Predefine Color has been set here
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kNavigationBarColor [UIColor colorWithRed : 33.0/255.0 green : 53.0/255.0 blue : 64.0/255.0 alpha : 1.0]

#define kfieldTextColor  [UIColor grayColor]
#define kButtonCornerColor   [UIColor darkGrayColor]

//User defaults set here
#define USER_DEFAULTS \
[NSUserDefaults standardUserDefaults]

#endif /* header_h */


