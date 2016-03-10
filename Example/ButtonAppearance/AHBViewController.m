//
//  AHBViewController.m
//  ButtonAppearance
//
//  Created by Alex Hsieh on 03/09/2016.
//  Copyright (c) 2016 Alex Hsieh. All rights reserved.
//

#import "AHBViewController.h"
#import "AHButton.h"
#import "UIButton+Appearance.h"

@interface AHBViewController ()
@property (weak, nonatomic) IBOutlet AHButton *buttonFromStoryBoard;
@property (weak, nonatomic) IBOutlet AHButton *buttonFromStoryBoard2;

@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@end

@implementation AHBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 280, 45)];
    [button3 setTitle:@"Button From Code" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [self.view3 addSubview:button3];

    
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 280, 45)];
    [button4 setTitle:@"Button From Code" forState:UIControlStateNormal];
    [button4 setBackgroundGradient:@[[UIColor grayColor],[UIColor blackColor]] forState:UIControlStateNormal];
    [button4 setBackgroundGradient:@[[UIColor lightGrayColor],[UIColor blackColor]] forState:UIControlStateNormal];
    [button4 setCornerRadius:6.0 borderWidth:1.0 borderColor:[UIColor blackColor]];
    [self.view4 addSubview:button4];

}

- (void)viewDidLayoutSubviews {
    UIColor *buttonColor = [UIColor colorWithRed:206/255.0 green:172/255.0 blue:92/255.0 alpha:1.0];
    UIColor *shadowColor = [UIColor colorWithRed:156/255.0 green:126/255.0 blue:66/255.0 alpha:1.0];

    [self.buttonFromStoryBoard setBackgroundColor:buttonColor forState:UIControlStateNormal];
    
    [self.buttonFromStoryBoard setShadowColor:shadowColor  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateNormal];
    [self.buttonFromStoryBoard setShadowColor:buttonColor  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateHighlighted];
    
    
    [self.buttonFromStoryBoard2 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonFromStoryBoard2 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
