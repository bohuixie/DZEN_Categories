
//  Created by Ignacio Romero Zurbuchen on 2/17/12.
//  Copyright (c) 2012 DZen Interaktiv. All rights reserved.
//

#import "NSArray+DZEN.h"

@implementation NSArray (DZEN) 

-(id)safeObjectAtIndex:(NSUInteger)index
{
    return [self objectAtIndex:index];
    
    @try {
        return [self objectAtIndex:index];
    } 
    @catch (id theException) {
        NSLog(@"*** safeObjectAtIndex exception: %@", theException);
        return nil;
    }
}

- (id)objectSortedByKey:(NSString *)key atIndex:(NSUInteger)index
{
    return [[self sortByKey:key] objectAtIndex: index];
}

- (NSArray *)sortByKey:(NSString *)key
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    return [self sortedArrayUsingDescriptors:sortDescriptors];
}

/*
- (id)objectSortedByPosition:(NSString *)key atIndex:(NSUInteger)index
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [self sortedArrayUsingDescriptors:sortDescriptors];
    
    return [sortedArray objectAtIndex:index];
}
 */

- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for (id element in enumerator)
    {
        [array addObject:element];
    }
    return array;
}

- (void)saveArrayToFile:(NSString *)filename;
{
    NSString *path = [NSString getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist",filename]];
    //NSLog(@"saveArrayToFile : %@",path);
    [NSKeyedArchiver archiveRootObject:self toFile:path];
}

+ (NSArray *)loadArrayfromFile:(NSString *)fileName
{
    NSString *path = [NSString getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist",fileName]];
    //NSLog(@"loadArrayfromFile : %@",path);
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

@end
