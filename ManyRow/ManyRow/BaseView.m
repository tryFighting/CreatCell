//
//  BaseView.m
//  PersonLife
//
//  Created by csmd on 2017/7/28.
//  Copyright © 2017年 jackLee. All rights reserved.
//

#import "BaseView.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
@interface BaseView ()

@property(nonatomic,strong)ButtonBlock block;

@property(nonatomic,strong)UIButton *button;

@end
@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame createdCell:(NSInteger)totoalCell withCellHeigt:(NSInteger)height andMargin:(NSInteger)margin dataSource:(NSArray *)dataSource withImages:(NSArray *)images andCurrentVC:(UIViewController *)vc{
   
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i < totoalCell; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            btn.frame = CGRectMake(0, 64+(height+margin)*i, SCREEN_WIDTH, height);
            
            btn.tag = 100 + i;
            //封装btn的颜色
            btn.backgroundColor  = [UIColor grayColor];
            
            [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [vc.view addSubview:btn];
            
            //左边视图
            UIImageView *imageViewleft = [[UIImageView alloc] init];
            
            imageViewleft.frame = CGRectMake(5, 10, height-10*2, height-10*2);
            
            imageViewleft.image = images[i];
            
            [btn addSubview:imageViewleft];
            
            //中间视图文本
            UILabel *midLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageViewleft.frame.size.width+imageViewleft.frame.origin.x+margin, 10, SCREEN_WIDTH-100,height-10*2)];
            
            midLabel.text = dataSource[i];
            
            midLabel.textAlignment = NSTextAlignmentLeft;
            
            [btn addSubview:midLabel];
            //右边视图
            UIImageView *imageView = [[UIImageView alloc] init];
            
            imageView.frame = CGRectMake(SCREEN_WIDTH-25, 25,10,10);
            
            imageView.image = [UIImage imageNamed:@"next.png"];
            
            [btn addSubview:imageView];
            
        }

    }
    return self;
}
//实现block回调的方法
- (void)addButtonAction:(ButtonBlock)block{
    self.block = block;
}
- (void)buttonAction:(UIButton *)sender{
    if (self.block) {
        self.block(sender.tag);
    }
}
@end
