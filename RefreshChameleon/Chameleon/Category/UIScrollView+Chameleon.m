//
//  UIScrollView+Chameleon.m
//  RefreshChameleon
//
//  Created by RavenZ on 2018/7/29.
//  Copyright © 2018年 RavenZ. All rights reserved.
//

#import "UIScrollView+Chameleon.h"

#import <objc/runtime.h>

static const char kHeadChameleonKey = '\0';

@implementation UIScrollView (Chameleon)

- (void)setHeadChameleon:(ChamleonHeadBaseView *)headChameleon {
    objc_setAssociatedObject(self, &kHeadChameleonKey, headChameleon, OBJC_ASSOCIATION_RETAIN);
}

- (ChamleonHeadBaseView *)headChameleon {
    return objc_getAssociatedObject(self, &kHeadChameleonKey);
}

- (void)addHeadChameleonCompletionBlock:(void (^)(void))completionBlock {
   
    ChamleonHeadBaseView *baseView = [[ChamleonHeadBaseView alloc] initWithFrame:CGRectZero scrollView:self];
    self.headChameleon = baseView;
    baseView.refreshCompletionBlock = completionBlock;
}

@end

//@implementation UITableView (Chameleon)
//
//- (void)addHeadChameleonCompletionBlock:(void (^)(void))completionBlock {
//    ChameleonBaseView *baseView = [[ChameleonBaseView alloc] init];
//    baseView.scrollView = self;
//    [baseView headRefreshCompletionBlock:^{
//        if (completionBlock) {
//            completionBlock();
//        }
//    }];
//}
//
//@end
