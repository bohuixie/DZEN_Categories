
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

- (void)removeInput
{
    UIScrollView *webViewContentView;
    for (UIView *checkView in [self subviews])
    {
        if ([checkView isKindOfClass:[UIScrollView class]])
        {
            webViewContentView = (UIScrollView *)checkView;
            break;
        }
    }
    
    for (UIView *checkView in [webViewContentView subviews])
    {
        if ([checkView.gestureRecognizers count] > 0)
        {
            //checkView.userInteractionEnabled = NO;
            
            NSLog(@"checkView = %@",NSStringFromClass([checkView class]));
            NSLog(@"checkView has %d gestures",[checkView.gestureRecognizers count]);
            
            NSMutableArray *gestures = [[NSMutableArray alloc] init];
            for (UIGestureRecognizer *gesture in checkView.gestureRecognizers)
            {
                if ([gesture isKindOfClass:[UITapGestureRecognizer class]])
                {
                    NSLog(@"FOUND TAP GESTURE");
                    [gestures addObject:gesture];
                }
                else
                {
                    NSLog(@"FOUND GESTURE : %@",NSStringFromClass([gesture class]));
                }
                
                /*
                if ([gesture isKindOfClass:[UITapGestureRecognizer class]])
                {
                    [gestures addObject:gesture];
                }
                 */
            }
            
            /*
            checkView.gestureRecognizers = nil;
            NSLog(@"checkView gestures : %@\n\n",checkView.gestureRecognizers);
             */
            
            NSLog(@"\n\ngestures = %@",gestures);
        }
    }
}

@end
