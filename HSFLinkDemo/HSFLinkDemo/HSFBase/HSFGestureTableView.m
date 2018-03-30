//
//  HSFGestureTableView.m
//  IPZhua
//
//  Created by 黄山锋 on 2018/3/29.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFGestureTableView.h"


@interface HSFGestureTableView ()

@end

@implementation HSFGestureTableView



-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}




//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//
//    if ([self panBack:gestureRecognizer]) {
//        return YES;
//    }
//    return NO;
//
//}
//
//
//- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
//
//    if (gestureRecognizer == self.panGestureRecognizer) {
//        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
//        CGPoint point = [pan translationInView:self];
//        UIGestureRecognizerState state = gestureRecognizer.state;
//        if (UIGestureRecognizerStateBegan == state || UIGestureRecognizerStatePossible == state) {
////            CGPoint location = [gestureRecognizer locationInView:self];
////            if (point.y > 0) {
////                return YES;
////                }
//            return YES;
//            }
//
//        }
//    return NO;
//
//}




@end
