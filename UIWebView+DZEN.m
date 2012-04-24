
//  Created by Ignacio Romero Zurbuchen on 2/12/12.
//  Copyright (c) 2012 DZen Interaktiv. All rights reserved.
//

#import "UIWebView+DZEN.h"

@implementation UIWebView (DZEN)

- (float)contentHeight
{
	return [[self stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight + document.body.offsetTop;"] floatValue];
}

- (CGSize)windowSize
{
    CGSize size;
    size.width = [[self stringByEvaluatingJavaScriptFromString:@"window.innerWidth"] integerValue];
    size.height = [[self stringByEvaluatingJavaScriptFromString:@"window.innerHeight"] integerValue];
    return size;
}

- (CGPoint)scrollOffset
{
    CGPoint pt;
    pt.x = [[self stringByEvaluatingJavaScriptFromString:@"window.pageXOffset"] integerValue];
    pt.y = [[self stringByEvaluatingJavaScriptFromString:@"window.pageYOffset"] integerValue];
    return pt;
}

- (void)removeBackgroundShadow
{
    for (UIView *eachSubview in [self.scrollView subviews])
    {
        if ([eachSubview isKindOfClass:[UIImageView class]] && eachSubview.frame.origin.x <= 500)
        {
            eachSubview.hidden = YES;
            [eachSubview removeFromSuperview];
        }
    }
}

- (void)enableInput:(BOOL)enable;
{
    UIScrollView *webViewContentView;
    for (UIView *checkView in [self subviews])
    {
        if ([checkView isKindOfClass:[UIScrollView class]])
        {
            webViewContentView = (UIScrollView *)checkView;
            [webViewContentView setScrollEnabled:!enable];
            NSLog(@"setScrollEnabled = %@\n", (!enable ? @"YES" : @"NO"));
            break;
        }
    }
    
    for (UIView *checkView in [webViewContentView subviews])
    {
        if ([checkView.gestureRecognizers count] > 0)
        {
            checkView.userInteractionEnabled = !enable;
            
            NSLog(@"checkView setUserInteractionEnabled = %@\n", (!enable ? @"YES" : @"NO"));
        }
    }
}

@end
