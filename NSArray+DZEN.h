
//  Created by Ignacio Romero Zurbuchen on 2/17/12.
//  Copyright (c) 2012 DZen Interaktiv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DZEN) 

- (id)safeObjectAtIndex:(NSUInteger)index;
- (NSArray *)reversedArray;

- (void)saveArrayToFile:(NSString *)filename;
+ (NSArray *)loadArrayfromFile:(NSString *)fileName;

@end