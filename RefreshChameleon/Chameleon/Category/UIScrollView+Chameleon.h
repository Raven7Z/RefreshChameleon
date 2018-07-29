//
//  UIScrollView+Chameleon.h
//  RefreshChameleon
//
//  Created by RavenZ on 2018/7/29.
//  Copyright © 2018年 RavenZ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChamleonHeadBaseView.h"

@interface UIScrollView (Chameleon)

@property (nonatomic, strong) ChamleonHeadBaseView *headChameleon;

- (void)addHeadChameleonCompletionBlock:(void(^)(void))completionBlock;

@end

//@interface UITableView (Chameleon)
//
//- (void)addHeadChameleonCompletionBlock:(void(^)(void))completionBlock;
//
//@end
