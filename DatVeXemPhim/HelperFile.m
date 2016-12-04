//
//  HelperFile.m
//  DatVeXemPhim
//
//  Created by Dung Duong on 11/24/16.
//  Copyright © 2016 Tai Duong. All rights reserved.
//

#import "HelperFile.h"

@implementation UIView (Custom)
-(void)addConstraintsWithFormat:(NSString *)format andViews:(NSArray *)viewsArray
{
    NSMutableDictionary *constraintsDictionary = [[NSMutableDictionary alloc] init];
    for (UIView *view in viewsArray)
    {
        NSString *key = [NSString stringWithFormat:@"v%li",[viewsArray indexOfObject:view]];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [constraintsDictionary setObject:view forKey:key];
    }
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:constraintsDictionary]];
}
@end
