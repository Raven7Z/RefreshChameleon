//
//  ChameleonBaseView.h
//  RefreshChameleon
//
//  Created by RavenZ on 2018/7/29.
//  Copyright © 2018年 RavenZ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RefreshChameleonCompletionBlock)(void);

@interface ChameleonBaseView : UIView

- (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView;

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, copy) RefreshChameleonCompletionBlock refreshCompletionBlock;

- (void)headRefreshCompletionBlock:(RefreshChameleonCompletionBlock)refreshCompletionBlock;

@end
