
//  Created by Ignacio Romero Zurbuchen on 2/12/12.
//  Copyright (c) 2012 DZen Interaktiv. All rights reserved.
//

#import "UIWebView+DZEN.h"

@implementation UIWebView (DZEN)

- (CGFloat)contentHeight
{
	return [[self stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight + document.body.offsetTop;"] floatValue];
}


@end
