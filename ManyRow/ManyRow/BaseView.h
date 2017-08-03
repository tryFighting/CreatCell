//
//  BaseView.h
//  PersonLife
//
//  Created by csmd on 2017/7/28.
//  Copyright © 2017年 jackLee. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonBlock)(NSInteger index);
@interface BaseView : UIView
- (void)addButtonAction:(ButtonBlock)block;
- (instancetype)initWithFrame:(CGRect)frame createdCell:(NSInteger)totoalCell withCellHeigt:(NSInteger)height andMargin:(NSInteger)margin dataSource:(NSArray *)dataSource withImages:(NSArray *)images andCurrentVC:(UIViewController *)vc;
@end
