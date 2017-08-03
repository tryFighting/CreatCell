//
//  ViewController.m
//  ManyRow
//
//  Created by csmd on 2017/8/3.
//  Copyright © 2017年 jackLee. All rights reserved.
//

#import "ViewController.h"
#import "BaseView.h"
@interface ViewController ()
@property(nonatomic,strong)BaseView *baseView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Button创立多行单元格";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
    //BaseView
    [self initSetting];
    
}
- (void)initSetting{
    
    UIImage *image0 = [UIImage imageNamed:@"leftImage.png"];
    self.baseView = [[BaseView alloc] initWithFrame:self.view.bounds createdCell:4 withCellHeigt:60 andMargin:10 dataSource:@[@"操作1",@"操作2",@"操作3",@"操作4"] withImages:@[image0,image0,image0,image0] andCurrentVC:self];
    __weak __typeof(&*self)weakSelf =self;
    [weakSelf.baseView addButtonAction:^(NSInteger index) {
        if (index == 100) {
            //执行的action
            NSLog(@"要进行的操作1");
            self.view.backgroundColor = [UIColor redColor];
        }else if (index == 101){
            //执行的action
            NSLog(@"要进行的操作2");
            self.view.backgroundColor = [UIColor yellowColor];

        }else if(index == 102){
            NSLog(@"要进行的操作3");
            self.view.backgroundColor = [UIColor greenColor];

        }else{
            NSLog(@"要进行的操作4");
            self.view.backgroundColor = [UIColor blueColor];

        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
