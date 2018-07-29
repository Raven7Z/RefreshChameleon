//
//  ChameleonBaseView.m
//  RefreshChameleon
//
//  Created by RavenZ on 2018/7/29.
//  Copyright © 2018年 RavenZ. All rights reserved.
//

#import "ChameleonBaseView.h"

@implementation ChameleonBaseView

- (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView {
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = scrollView;
        [self chameleon_registerScrollViewListener];
    }
    return self;
}

- (void)dealloc {
    [self chameleon_cancelScrollViewListener];
}

#pragma mark - public method
- (void)headRefreshCompletionBlock:(RefreshChameleonCompletionBlock)refreshCompletionBlock {
    self.refreshCompletionBlock = refreshCompletionBlock;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if (self.refreshCompletionBlock) {
        self.refreshCompletionBlock();
    }
}

#pragma mark - privater method
- (void)chameleon_registerScrollViewListener {
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)chameleon_cancelScrollViewListener {
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
