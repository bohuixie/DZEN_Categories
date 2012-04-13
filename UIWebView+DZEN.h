
//  Created by Ignacio Romero Zurbuchen on 2/12/12.
//  Copyright (c) 2012 DZen Interaktiv. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIWebView (DZEN)

- (float)contentHeight;
- (CGSize)windowSize;
- (CGPoint)scrollOffset;

- (void)removeInput;
- (void)removeBackgroundShadow;

@end
